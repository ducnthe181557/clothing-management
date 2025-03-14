package org.example.clothingmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.clothingmanagement.entity.TransferOrder;
import org.example.clothingmanagement.repository.TransferOrderDAO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TransferOrderListServlet", value = "/TOList")
public class TransferOrderListServlet extends HttpServlet {

    private TransferOrderDAO transferOrderDAO;

    @Override
    public void init() {
        transferOrderDAO = new TransferOrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("cancel".equals(action)) {
            String toID = request.getParameter("toID");
            if (toID != null && !toID.trim().isEmpty()) {
                boolean isCanceled = transferOrderDAO.cancelTransferOrder(toID);
                if (isCanceled) {
                    // Redirect to the list page after successful deletion
                    response.sendRedirect("/ClothingManagement_war_exploded/TOList");
                } else {
                    // If deletion failed, set an error message
                    request.setAttribute("errorMessage", "Error canceling the transfer order.");
                    request.getRequestDispatcher("to-list.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Invalid Transfer Order ID.");
                request.getRequestDispatcher("to-list.jsp").forward(request, response);
            }
        } else {
            // Default: Show all transfer orders
            List<TransferOrder> transferOrders = transferOrderDAO.getAllTransferOrders();
            request.setAttribute("transferOrders", transferOrders);
            request.getRequestDispatcher("to-list.jsp").forward(request, response);
        }
    }
}
