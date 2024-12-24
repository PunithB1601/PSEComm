package com.emp.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.customer.dao.OrderDao;
import com.customer.dao.OrderDaoImp;
import com.customer.dto.Order;

@WebServlet("/updateorders")
public class OrderActionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final OrderDao orderDao;

    public OrderActionServlet() {
        super();
        this.orderDao = new OrderDaoImp();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String orderStatus = request.getParameter("orderStatus");
        String employeeId = request.getParameter("employeeId");
        String orderIdParam = request.getParameter("orderId");

        try {
            if (orderIdParam == null || orderIdParam.isEmpty()) {
                response.getWriter().write("Order ID is missing!");
                return;
            }

            int orderId = Integer.parseInt(orderIdParam);
            Order order = orderDao.getOrder(orderId);

            if (order == null) {
                request.setAttribute("failure", "Order not found!!");
                RequestDispatcher rd=request.getRequestDispatcher("Dispatcher.jsp");
                rd.forward(request, response);
                return;
            }

            if ("Assign".equalsIgnoreCase(action)) {
                if (employeeId == null || employeeId.isEmpty()) {
                    request.setAttribute("failure", "Employee ID is missing!!");
                    RequestDispatcher rd=request.getRequestDispatcher("Dispatcher.jsp");
                    rd.forward(request, response);
                    return;
                }

                int eid = Integer.parseInt(employeeId);
                order.setEid(eid);
                order.setStatus("Assigned");
                orderDao.UpdateOrder(order);
                request.setAttribute("success", "Order assigned successfully!");
                RequestDispatcher rd=request.getRequestDispatcher("Dispatcher.jsp");
                rd.forward(request, response);
            } else if ("Update".equalsIgnoreCase(action)) {
                if (orderStatus == null || orderStatus.isEmpty()) {
                    request.setAttribute("failure", "Order status is missing!");
                    RequestDispatcher rd=request.getRequestDispatcher("Dispatcher.jsp");
                    rd.forward(request, response);
                    return;
                }

                order.setStatus(orderStatus);
                if ("Delivered".equalsIgnoreCase(orderStatus)) {
                    order.setDeliveryDate(new java.sql.Timestamp(System.currentTimeMillis()));
                }
                orderDao.UpdateOrder(order);
                request.setAttribute("success", "Order assigned successfully!");
                RequestDispatcher rd=request.getRequestDispatcher("Dispatcher.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("failure", "Invalid action!");
                RequestDispatcher rd=request.getRequestDispatcher("Dispatcher.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("failure", "Error occurred while processing the request");
            RequestDispatcher rd=request.getRequestDispatcher("Dispatcher.jsp");
            rd.forward(request, response);
        }
    }
}
