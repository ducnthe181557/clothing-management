package org.example.clothingmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.clothingmanagement.entity.Bin;
import org.example.clothingmanagement.entity.Section;
import org.example.clothingmanagement.entity.TODetail;
import org.example.clothingmanagement.entity.TransferOrder;
import org.example.clothingmanagement.repository.DBContext;
import org.example.clothingmanagement.repository.EmployeeDAO;
import org.example.clothingmanagement.repository.SectionDAO;
import org.example.clothingmanagement.repository.TransferOrderDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.*;

@WebServlet(name = "CreateTransferOrderServlet", value = "/TOCreate")
public class TransferOrderCreateServlet extends HttpServlet {
    private TransferOrderDAO transferOrderDAO;
    private EmployeeDAO employeeDAO;
    private SectionDAO sectionDAO;

    @Override
    public void init() {
        transferOrderDAO = new TransferOrderDAO();
        employeeDAO = new EmployeeDAO();
        sectionDAO = new SectionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Tự gen to id mới
        String nextToID = transferOrderDAO.getNextToID();
        request.setAttribute("nextToID", nextToID);

        // Lâý section -> bin -> product
        List<Section> sections = sectionDAO.getAllSection();
        request.setAttribute("sections", sections);

        // lấy all bin
        List<String> binIds = transferOrderDAO.getAllBinIds();
        request.setAttribute("binIds", binIds);
        request.getRequestDispatcher("to-create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //lấy all bin id
            List<String> binIds = transferOrderDAO.getAllBinIds();
            request.setAttribute("binIds", binIds);

            // goi phương thức validate
            if (!validateTransferOrderCreation(request)) {
                preserveFormData(request);
                request.getRequestDispatcher("to-create.jsp").forward(request, response);
                return;
            }

            // lấy to id từ jsp
            String toID = request.getParameter("toID");

            // check null to id
            if (toID == null || toID.trim().isEmpty()) {
                preserveFormData(request);
                request.setAttribute("errorToID", "Transfer Order ID không được để trống.");
                request.getRequestDispatcher("to-create.jsp").forward(request, response);
                return;
            }

            // check toID tồn tại không
            if (transferOrderDAO.isTransferOrderIDExist(toID)) {
                preserveFormData(request);
                request.setAttribute("errorToID", "Transfer Order ID đã tồn tại.");
                request.getRequestDispatcher("to-create.jsp").forward(request, response);
                return;
            }

            // Lấy thông tin người tạo và trạng thái khi tạo auto create = pending
            String createdBy = request.getParameter("createdBy");
            String createdName = request.getParameter("createdByName");
            String status = "Pending";

            // Xác thực ngày tạo
            LocalDate createdDate;
            try {
                createdDate = LocalDate.parse(request.getParameter("createdDate"));
            } catch (DateTimeParseException e) {
                request.setAttribute("errorDate", "Định dạng ngày không hợp lệ.");
                request.getRequestDispatcher("to-create.jsp").forward(request, response);
                return;
            }

            // Xác thực bin
            String originBinID = request.getParameter("originBinID");
            String finalBinID = request.getParameter("finalBinID");

            // Lấy thông tin chi tiết sản phẩm (trước khi tạo Transfer Order để kiểm tra dung lượng)
            String[] productDetailIDs = request.getParameterValues("productDetailID[]");
            String[] quantities = request.getParameterValues("quantity[]");

            double totalWeight = 0.0;

            // Tính toán tổng trọng lượng trước khi xử lý để kiểm tra dung lượng bin đích
            for (int i = 0; i < productDetailIDs.length; i++) {
                try {
                    String productDetailID = productDetailIDs[i];
                    int quantity = Integer.parseInt(quantities[i]);

                    // Tính trọng lượng sản phẩm
                    double productWeight = transferOrderDAO.getProductWeight(productDetailID);
                    totalWeight += productWeight * quantity;
                } catch (NumberFormatException e) {
                    preserveFormData(request);
                    request.setAttribute("errorQuantity3", "Định dạng số lượng không hợp lệ.");
                    request.getRequestDispatcher("to-create.jsp").forward(request, response);
                    return;
                }
            }

            // Kiểm tra sức chứa của bin đích
            double binMaxCapacity = transferOrderDAO.getBinMaxCapacity(finalBinID);
            double currentBinWeight = transferOrderDAO.getCurrentBinWeight(finalBinID);
            // tính tổng trọng lượng nếu chuyển products từ đơn TO vào
            double totalWeightAfterTransfer = currentBinWeight + totalWeight;

            System.out.println("Final Bin Max Capacity: " + binMaxCapacity);
            System.out.println("Current Bin Weight: " + currentBinWeight);
            System.out.println("Total Transfer Order Weight: " + totalWeight);
            System.out.println("Total After Add TO: " + totalWeightAfterTransfer);

            //so sánh max capacity của bin với tổng trọng lượng sau khi chuyển vào
            // > -> fail / < -> success
            if (totalWeightAfterTransfer > binMaxCapacity) {
                request.setAttribute("errorCapacity", "Bin đích không đủ sức chứa cho số lượng sản phẩm này.");
                //lấy lại thông tin để hiển thị
                preserveFormData(request);
                request.getRequestDispatcher("to-create.jsp").forward(request, response);
                return;
            }


            // Tạo Transfer Order sau khi đã kiểm tra dung lượng
            TransferOrder transferOrder = new TransferOrder(toID, createdDate, createdBy, status);

            // Thêm Transfer Order vào cơ sở dữ liệu
            boolean isOrderCreated = transferOrderDAO.createTransferOrder(transferOrder);

            if (isOrderCreated) {
                // Reset totalWeight để tính lại trong quá trình xử lý chi tiết
                totalWeight = 0.0;

                // Xác thực và xử lý từng sản phẩm
                for (int i = 0; i < productDetailIDs.length; i++) {
                    try {
                        String productDetailID = productDetailIDs[i];
                        int quantity = Integer.parseInt(quantities[i]);


                        // Kiểm tra số lượng trong bin nguồn
                        int availableQuantityInOriginBin = transferOrderDAO.getBinQuantity(originBinID, productDetailID);
                        if (availableQuantityInOriginBin < quantity) {
                            preserveFormData(request);
                            request.setAttribute("errorQuantity2", "Số lượng không đủ trong bin nguồn.");
                            request.getRequestDispatcher("to-create.jsp").forward(request, response);
                            return;
                        }

                        // Tính trọng lượng sản phẩm
                        double productWeight = transferOrderDAO.getProductWeight(productDetailID);
                        System.out.println("Product weight " + productDetailID + ": " + productWeight); // Ghi log trọng lượng sản phẩm
                        System.out.println("Quantity of " + productDetailID + ": " + quantity);
                        totalWeight += productWeight * quantity;
                        System.out.println("Total weight of order: " + totalWeight); // Ghi log trọng lượng đã cập nhật

                        // Tạo TODetail
                        TODetail toDetail = new TODetail();
                        toDetail.setToDetailID(UUID.randomUUID().toString());
                        toDetail.setProductDetailID(productDetailID);
                        toDetail.setQuantity(quantity);
                        toDetail.setToID(toID);
                        toDetail.setOriginBinID(originBinID);
                        toDetail.setFinalBinID(finalBinID);

                        // Thêm TODetail vào cơ sở dữ liệu
                        boolean isTODetailCreated = transferOrderDAO.addTODetail(toDetail);
                        if (!isTODetailCreated) {
                            request.setAttribute("errorDetail", "Lỗi khi tạo chi tiết Transfer Order.");
                            request.getRequestDispatcher("to-create.jsp").forward(request, response);
                            return;
                        }

                    } catch (NumberFormatException e) {
                        preserveFormData(request);
                        request.setAttribute("errorQuantity3", "Định dạng số lượng không hợp lệ.");
                        request.getRequestDispatcher("to-create.jsp").forward(request, response);
                        return;
                    }
                }

            } else {
                preserveFormData(request);
                request.setAttribute("errorOrder", "Lỗi khi tạo Transfer Order.");
                request.getRequestDispatcher("to-create.jsp").forward(request, response);
                return;
            }

            // Chuyển hướng sau khi tạo thành công
            request.getSession().setAttribute("successMessage", "Transfer Order đã được tạo thành công.");
            response.sendRedirect(request.getContextPath() + "/TOList");


        } catch (Exception e) {
            e.printStackTrace();
            preserveFormData(request);
            request.setAttribute("errorGeneral", "Đã xảy ra lỗi không mong muốn.");
            request.getRequestDispatcher("to-create.jsp").forward(request, response);
        }
    }


    private boolean validateTransferOrderCreation(HttpServletRequest request) {
        // Kiểm tra Transfer Order ID
        String toID = request.getParameter("toID");
        if (toID == null || toID.trim().isEmpty()) {
            request.setAttribute("errorToID", "Transfer Order ID không được để trống.");
            return false;
        }

        if (transferOrderDAO.isTransferOrderIDExist(toID)) {
            request.setAttribute("errorToID", "Transfer Order ID đã tồn tại.");
            return false;
        }


        // Xác thực Bin
        String finalBinID = request.getParameter("finalBinID");

        // Xác thực sản phẩm và số lượng
        String[] productDetailIDs = request.getParameterValues("productDetailID[]");
        String[] quantities = request.getParameterValues("quantity[]");


        double totalTransferWeight = 0.0;
        for (int i = 0; i < productDetailIDs.length; i++) {
            try {
                String productDetailID = productDetailIDs[i];
                int quantity = Integer.parseInt(quantities[i]);

                // Tính tổng trọng lượng
                double productWeight = transferOrderDAO.getProductWeight(productDetailID);
                totalTransferWeight += productWeight * quantity;
            } catch (NumberFormatException e) {
                request.setAttribute("errorQuantity3", "Định dạng số lượng không hợp lệ.");
                return false;
            }
        }

        // Kiểm tra sức chứa của bin đích
        double binMaxCapacity = transferOrderDAO.getBinMaxCapacity(finalBinID);
        double currentBinWeight = transferOrderDAO.getCurrentBinWeight(finalBinID);
        double processingTransferWeight = transferOrderDAO.getProcessingTransferTotalWeight(finalBinID);
        double totalWeightAfterTransfer = currentBinWeight + totalTransferWeight;

        System.out.println("Final Bin Max Capacity: " + binMaxCapacity);
        System.out.println("Current Bin Weight: " + currentBinWeight);
        System.out.println("Processing Transfer Weight: " + processingTransferWeight);
        System.out.println("Total Transfer Order Weight: " + totalTransferWeight);
        System.out.println("Total After Add TO: " + totalWeightAfterTransfer);

        if (totalWeightAfterTransfer > binMaxCapacity) {
            request.setAttribute("errorCapacity", "Bin đích không đủ sức chứa cho số lượng sản phẩm này. " +
                    "Sức chứa tối đa: " + binMaxCapacity + " kg. " +
                    "Trọng lượng hiện tại: " + currentBinWeight + " kg. " + 
                    "Trọng lượng cần chuyển: " + totalTransferWeight + " kg.");
            return false;
        }

        return true;
    }

    private void preserveFormData(HttpServletRequest request) {
        // Preserve the TO ID
        String nextToID = transferOrderDAO.getNextToID();
        request.setAttribute("nextToID", nextToID);

        // Get all bins for dropdowns
        List<String> binIds = transferOrderDAO.getAllBinIds();
        request.setAttribute("binIds", binIds);

        // Get sections
        List<Section> sections = sectionDAO.getAllSection();
        request.setAttribute("sections", sections);

        // Preserve other form data
        request.setAttribute("createdBy", request.getParameter("createdBy"));
        request.setAttribute("createdByName", request.getParameter("createdByName"));
        request.setAttribute("createdDate", request.getParameter("createdDate"));
        // Add to preserveFormData method
        request.setAttribute("originSectionID", request.getParameter("originSectionID"));
        request.setAttribute("finalSectionID", request.getParameter("finalSectionID"));
        request.setAttribute("originBinID", request.getParameter("originBinID"));
        request.setAttribute("finalBinID", request.getParameter("finalBinID"));

        // For product details, we need to handle them differently
        String[] productDetailIDs = request.getParameterValues("productDetailID[]");
        String[] quantities = request.getParameterValues("quantity[]");

        if (productDetailIDs != null && quantities != null) {
            // Create a list to store product details for JSP processing
            List<Map<String, Object>> productDetails = new ArrayList<>();

            for (int i = 0; i < productDetailIDs.length; i++) {
                Map<String, Object> detail = new HashMap<>();
                detail.put("productDetailID", productDetailIDs[i]);
                detail.put("quantity", quantities[i]);
                productDetails.add(detail);
            }

            request.setAttribute("savedProductDetails", productDetails);
        }
    }

}
