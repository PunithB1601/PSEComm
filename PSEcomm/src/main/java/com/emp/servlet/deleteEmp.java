package com.emp.servlet;

import java.io.IOException;
import com.emp.DAO.EmployeeDAO;
import com.emp.DAO.EmployeeDAOImp;
import com.emp.DTO.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteEmployee")
public class deleteEmp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String eid = req.getParameter("eid");
        String delete = req.getParameter("delete");

        if (session == null || session.getAttribute("employee") == null) {
            req.setAttribute("failure", "Unauthorized access. Please log in.");
            RequestDispatcher rd=req.getRequestDispatcher("EmpList.jsp");
            rd.forward(req, resp);
            return;
        }

        if (eid == null || eid.isEmpty()) {
            req.setAttribute("failure", "EID number is missing.");
            RequestDispatcher rd=req.getRequestDispatcher("EmpList.jsp");
            rd.forward(req, resp);
            return;
        }

        try {
            Employee currentUser = (Employee) session.getAttribute("employee");
            EmployeeDAO edao = new EmployeeDAOImp();
            int empId = Integer.parseInt(eid);
            Employee targetEmployee = edao.getEmployee(empId);
            if (targetEmployee == null) {
                req.setAttribute("failure", "Employee not found.");
                RequestDispatcher rd=req.getRequestDispatcher("EmpList.jsp");
                rd.forward(req, resp);
                return;
            }

            // Prevent deleting CEO account
            if (targetEmployee.getJob().equalsIgnoreCase("CEO")) {
                req.setAttribute("failure", "Cannot delete the CEO account.");
            } 
            // Prevent user from deleting their own account
            else if (currentUser.getEid() == targetEmployee.getEid()) {
                req.setAttribute("failure", "You cannot delete your own account.");
            } 
            // Attempt to delete employee
            else if ("Delete".equalsIgnoreCase(delete)) 
            {
                boolean isDeleted = edao.deleteemployee(targetEmployee);
                if (isDeleted) {
                    req.setAttribute("success", "Employee deleted successfully.");
                } else {
                    req.setAttribute("failure", "Failed to delete employee. Please try again.");
                }
            } else {
                req.setAttribute("failure", "Invalid operation.");
            }
        } catch (NumberFormatException e) {
            req.setAttribute("failure", "Invalid Employee ID format.");
        }

        RequestDispatcher rd=req.getRequestDispatcher("EmpList.jsp");
        rd.forward(req, resp);
    }


}
