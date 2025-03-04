package org.example.clothingmanagement.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.clothingmanagement.entity.Bin;
import org.example.clothingmanagement.entity.Product;
import org.example.clothingmanagement.service.BinService;
import org.example.clothingmanagement.service.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ViewBinInventoryServlet", value = "/viewbininventory")
public class ViewBinInventoryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddAcc</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAcc at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String binID = request.getParameter("binID");
        ProductService productService = new ProductService();
        BinService binService = new BinService();
        int page = 1;
        int pageSize = 5; // Số dòng trên mỗi trang

        // Lấy tham số trang từ request
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }

        int totalProducts = 0;

        List<Product> products;
        if (binID != null && !binID.isEmpty()) {
            totalProducts = productService.countProductsByBinID(binID);
            products = productService.getProductsByBinID(binID, page, pageSize);
        } else {
            totalProducts =productService.countAllProducts();
            products = productService.getAllProduct();
        }
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        List<Bin> binList = binService.getAllBins();
        request.setAttribute("binList", binList);
        request.setAttribute("list", products);
        request.setAttribute("selectedBin", binID);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("./ViewBinInventory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
