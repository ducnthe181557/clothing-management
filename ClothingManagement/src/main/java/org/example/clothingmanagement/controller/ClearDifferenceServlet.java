package org.example.clothingmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.clothingmanagement.entity.BinDetail;
import org.example.clothingmanagement.entity.Employee;
import org.example.clothingmanagement.entity.InventoryDocDetail;
import org.example.clothingmanagement.repository.InventoryDocDAO;
import org.example.clothingmanagement.repository.InventoryDocDetailDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "ClearDifferenceServlet", value = "/ClearDifferenceServlet")
public class ClearDifferenceServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String binId = request.getParameter("binId");
        String inventoryDocId = request.getParameter("inventoryDocId");
        List<Employee> employeeList = InventoryDocDAO.getAllEmployee();

        List <BinDetail> listDetail= InventoryDocDAO.getBinDetailByBinID(binId);
        List<InventoryDocDetail> listInvenDoc = InventoryDocDetailDAO.getInventoryDocDetailsByDocID(inventoryDocId);

        List<InventoryDocDetail> filteredList = new ArrayList<>();

        for (InventoryDocDetail invenDetail : listInvenDoc) {
            boolean isDuplicate = false;

            for (BinDetail binDetail : listDetail) {
                if (invenDetail.getProductDetailId().equals(binDetail.getProductDetailId()) &&
                        invenDetail.getRecountQuantity() == binDetail.getQuantity()) {
                    isDuplicate = true;
                    break;  // Nếu tìm thấy trùng, không cần kiểm tra tiếp
                }
            }

            // Chỉ thêm vào danh sách mới nếu KHÔNG trùng
            if (!isDuplicate) {
                filteredList.add(invenDetail);
            }
        }

        request.setAttribute("listInvenDoc", filteredList);
        request.setAttribute("inventoryDocId", inventoryDocId);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("binId", binId);
        request.getRequestDispatcher("clearDifference.jsp").forward(request,response);


    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            // Lấy InventoryDocID từ request
            String inventoryDocId = request.getParameter("inventoryDocId");
            String binId = request.getParameter("binId");

            // Lấy danh sách ProductDetailID và RecountQuantity
            String[] productDetailIds = request.getParameterValues("productDetailId[]");
            String[] recountQuantitiesStr = request.getParameterValues("recountQuantity[]");

            // Chuyển đổi sang danh sách
            List<String> productDetailIdList = new ArrayList<>();
            List<Integer> recountQuantityList = new ArrayList<>();

            for (int i = 0; i < productDetailIds.length; i++) {
                productDetailIdList.add(productDetailIds[i]);
                recountQuantityList.add(Integer.parseInt(recountQuantitiesStr[i]));
            }

            // Gọi DAO để cập nhật dữ liệu
            InventoryDocDAO.updateBinDetails(binId,productDetailIdList, recountQuantityList);
            InventoryDocDAO.updateInventoryDocStatus(inventoryDocId,"Confirmed");
            InventoryDocDAO.changeBinStatus(binId,1);

            // Chuyển hướng sau khi cập nhật thành công
            response.sendRedirect("ViewInventoryDocList");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ViewInventoryDocList");
        }


    }


}