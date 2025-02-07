package org.example.clothingmanagement.controller;



import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.clothingmanagement.entity.Category;
import org.example.clothingmanagement.repository.CategoryDAO;
import org.example.clothingmanagement.service.CategoryService;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


@WebServlet(name = "EditCategoryServlet", value = "/EditCategoryServlet")
public class EditCategoryServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("categoryID"));
          CategoryDAO dao = new CategoryDAO();
        try {
            Category category = dao.getCategoryByID(id);
            request.setAttribute("category", category);
            request.getRequestDispatcher("editCategory.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("categoryId"));
        String name = request.getParameter("categoryName");
        CategoryService dao = new CategoryService();
        Category category = new Category(id, name, new Date(), 1);

        List<String> errors = new ArrayList<>();

        // Kiểm tra độ dài không quá 20 ký tự
        if (name.length() > 15) {
            errors.add("Tên danh mục không được dài quá 15 ký tự.");
        }

        // Kiểm tra không chứa ký tự đặc biệt ngoại trừ "-"
        if (!name.matches("^[A-Z][a-zA-Z\\s-]*$")) {
            errors.add("Tên danh mục chỉ được chứa chữ cái, khoảng trắng, dấu '-' và chữ cái đầu phải viết hoa.");
        }

        try {
            // Kiểm tra xem tên danh mục đã tồn tại chưa
            if (dao.checkCategoryNameExist(name)) {
                errors.add("Tên danh mục này đã tồn tại.");
            }

            if (!errors.isEmpty()) {
                // Nếu có lỗi, hiển thị tất cả bằng alert
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script type='text/javascript'>");
                out.println("alert('" + errors.stream().map(error -> error.replace("'", "\\'")).collect(Collectors.joining("\\n")) + "');");
                out.println("window.history.back();"); // Quay lại trang trước
                out.println("</script>");

            } else {
                // Nếu không có lỗi, tiến hành cập nhật danh mục
                dao.updateCategory(category);
                response.sendRedirect("CategoryServlet");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }



}