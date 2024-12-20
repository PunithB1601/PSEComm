package com.emp.DAO;

import com.emp.DTO.Employee;

import java.util.List;

public interface EmployeeDAO
{
    public  boolean createEmployee(Employee e);
    public Employee getEmployee(int eid,String password);
    public Employee grtEmployee(String email, String password);
    public Employee getEmployee(int eid);
    public List getEmployee();
    public boolean updateemployee(Employee e);
    public boolean deleteemployee(Employee e);
    public List getManager();
    public List getSalesman();
    public List getDetails();
    public Employee getEmployee(String mail);

}
