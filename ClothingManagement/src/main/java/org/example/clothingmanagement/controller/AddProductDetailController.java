package org.example.clothingmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.clothingmanagement.entity.Category;
import org.example.clothingmanagement.entity.Product;
import org.example.clothingmanagement.entity.ProductDetail;
import org.example.clothingmanagement.entity.Supplier;
import org.example.clothingmanagement.repository.CategoryDAO;
import org.example.clothingmanagement.service.CategoryService;
import org.example.clothingmanagement.service.ProductDetailService;
import org.example.clothingmanagement.service.ProductService;
import org.example.clothingmanagement.service.SupplierService;

import java.io.IOException;
import java.util.List;

@WebServlet(name="AddProductDetail", urlPatterns = "/add-product-detail")
public class AddProductDetailController extends HttpServlet {
    private final ProductDetailService pds = new ProductDetailService();
    private final ProductService ps = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Product product = new Product();
        if(ps.getProductById(id).isPresent()){
            product = ps.getProductById(id).get();
        }
        else{
            product = new Product();
        }
        req.setAttribute("product", product);
        req.getRequestDispatcher("/add-product-detail.jsp").forward(req, resp);



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("id");
        Integer quantity = 0;
        Double weight = Double.parseDouble(req.getParameter("weight"));
        String color = req.getParameter("color");
        if(color.matches("^[a-zA-Z]+$")){
            color = color.toLowerCase();
            color = color.substring(0,1).toUpperCase() + color.substring(1);
        }
        else{
            color = "XXX";
        }
        String size = req.getParameter("size");
//        String urlImage = req.getParameter("image");
        String urlImage = "";
        Integer status=1;
        ProductDetail pd = new ProductDetail();
        // viết hàm tự gen ra productdetailid
        if(pds.getLastProductDetail(productId).isPresent()){
            pd = pds.getLastProductDetail(productId).get();
        }
        else{
            pd = new ProductDetail();
        }
        String code = pd.getId().substring(0,2);
        String number = pd.getId().substring(2);
        int num = Integer.parseInt(number);
        num += 1; // Tăng số lên 1
        String newStr = String.format("%03d", num); // Đảm bảo số có 3 chữ số
        String id = code + newStr; // Nối chuỗi code và newStr
        ProductDetail productDetail = new ProductDetail(weight,status,size,quantity,productId,urlImage,id,color);
        boolean check = pds.insertProductDetail(productDetail);
        if (check) {
            HttpSession session = req.getSession();
            session.setAttribute("alertMessage", "Successfully.");
            session.setAttribute("alertType", "success");
            resp.sendRedirect(req.getContextPath() + "/list-product-detail?id=" + productId + "");
        } else {
            req.setAttribute("alertMessage", "Failed.");
            req.setAttribute("alertType", "error");
            req.getRequestDispatcher("/add-product-detail.jsp").forward(req, resp);
        }




    }
}
