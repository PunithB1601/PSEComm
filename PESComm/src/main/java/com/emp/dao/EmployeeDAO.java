package com.emp.dao;

import java.util.List;

import com.emp.dto.Employee;

public interface EmployeeDAO {
		public boolean InsertEmp(Employee e);
		public boolean updateEmp(Employee e);
		public boolean deleteEmp(Employee e);
		public Employee getEmp(String emailid,String password);
		public List<Employee> getEmp();
}