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


@WebServlet("/UpdateProfileServlet")
public class UpdateProfile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int eid = Integer.parseInt(req.getParameter("eid"));
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String mailid = req.getParameter("mailid");
        long phone = Long.parseLong(req.getParameter("phone"));

        // Set employee details
        Employee emp = new Employee();
        emp.setEid(eid);
        emp.setFname(fname);
        emp.setLname(lname);
        emp.setDOB(dob);
        emp.setGender(gender);
        emp.setMail(mailid);
        emp.setPhone(phone);

        EmployeeDAO edao = new EmployeeDAOImp();
        boolean res = edao.UpdateProfile(emp);

        // Set message based on the result
        if (res) {
            req.setAttribute("updateMessage", "Profile updated successfully!");
        } else {
            req.setAttribute("updateMessage", "Failed to update profile. Please try again.");
        }

        // Forward back to Salesman Dashboard
        RequestDispatcher rd = req.getRequestDispatcher("SalesmanDashboard.jsp");
        rd.forward(req, resp);
    }
}
