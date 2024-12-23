package com.emp.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.emp.DAO.EmployeeDAOImp;
import com.emp.DTO.Employee;
import com.emp.DAO.EmployeeDAO;

/**
 * Servlet implementation class AddEmp
 */
@WebServlet("/addemp")
public class AddEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("First Name: " + req.getParameter("fname"));
//		System.out.println("Last Name: " + req.getParameter("lname"));
//		System.out.println("Phone: " + req.getParameter("phone"));
//			System.out.println("emailid: " + req.getParameter("mailid"));
			//req.getSession().removeAttribute("employee");

			
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			String dob = req.getParameter("dob");
			String gender = req.getParameter("gender");
			String designation = req.getParameter("job");
			int manager = Integer.parseInt(req.getParameter("mgr"));
			String doj = req.getParameter("doj");
			String salary = req.getParameter("sal");  
			String commission = req.getParameter("comm"); 
			int deptNo = Integer.parseInt(req.getParameter("dno"));  
			int cid = Integer.parseInt(req.getParameter("cid"));
			String emailID = req.getParameter("mailid"); 
			long phoneNumber = Long.parseLong(req.getParameter("phone"));
		    String Password=req.getParameter("Password");

	        
	        Employee e = new Employee();
	        e.setFname(fname);
	        e.setLname(lname);
	        e.setDOB(dob);
	        e.setGender(gender);
	        e.setJob(designation);
	        e.setMgr(manager);
	        e.setDoj(doj);
	        e.setSalary(Double.parseDouble(salary));
	        e.setCommition(Double.parseDouble(commission));
	        e.setDno(deptNo);
	        e.setCid(cid);
	        e.setMail(emailID);
	        e.setPhone(phoneNumber);
	        e.setPassword(Password);
	       
	        
	        
	        EmployeeDAO edao=new EmployeeDAOImp();
	        boolean result = edao.createEmployee(e);
	        if(result) {
	   		 req.setAttribute("success", "Employee Added Successfully!");
	   		 RequestDispatcher rd = req.getRequestDispatcher("AddEmployee.jsp");
	   		 rd.forward(req, resp);
	   	 }
	   	 else {
	   		 req.setAttribute("failure", "Unable to Add Employee! Try Again Later");
	   		 RequestDispatcher rd = req.getRequestDispatcher("AddEmployee.jsp");
	   		 rd.forward(req, resp);
	   	 }


		}

}
