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

        HttpSession session=req.getSession(false);
        Employee emp =(Employee)session.getAttribute("employee");
        emp.setEid(eid);
        emp.setFname(fname);
        emp.setLname(lname);
        emp.setDOB(dob);
        emp.setGender(gender);
        emp.setMail(mailid);
        emp.setPhone(phone);

        EmployeeDAO edao = new EmployeeDAOImp();
        boolean res = edao.UpdateProfile(emp);

        
        if(res)
        {
        	req.setAttribute("success", "Profile updated successfully!");
        	RequestDispatcher rd = req.getRequestDispatcher("EmployeeProfile.jsp");
            rd.forward(req, resp);
        }
        else {
            req.setAttribute("failure", "Failed to update profile. Please try again.");
        }

        
        
    }
}
