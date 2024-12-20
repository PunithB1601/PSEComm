package com.emp.DAO;

import com.database.DBConnection;
import com.emp.DTO.Department;
import com.emp.DTO.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAOImp implements EmployeeDAO
{
   private Connection con=null;

   public EmployeeDAOImp()
    {
        this.con=DBConnection.getConnection();
    }

    @Override
    public boolean createEmployee(Employee e)
    {
        PreparedStatement ps=null;
        String query="INSERT INTO EMP VALUES(0,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int res=0;
        try
        {
            con.setAutoCommit(false);
            ps=con.prepareStatement("query");
            ps.setString(1, e.getFname());
            ps.setString(2,e.getLname());
            ps.setString(3,e.getDOB());
            ps.setString(4,e.getGender());
            ps.setString(5,e.getJob());
            ps.setInt(6,e.getMgr());
            ps.setString(7,e.getDoj());
            ps.setDouble(8,e.getSalary());
            ps.setDouble(9,e.getCommition());
            ps.setInt(10,e.getDno());
            ps.setInt(11,e.getCid());
            ps.setLong(12,e.getPhone());
            ps.setString(13,e.getMail());
            ps.setString(14,e.getPassword());
            res=ps.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        if(res>0)
        {
            try {
                con.commit();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            return true;
        }
        else {
            try {
                con.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            return false;
        }

    }

    @Override
    public Employee getEmployee(int eid, String password)
    {
        String query="SELECT * FROM EMP WHERE EID=? AND PASSWORD=?";
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try
        {
            ps=con.prepareStatement(query);
            ps.setInt(1, eid);
            ps.setString(2, password);
            rs=ps.executeQuery();
            while(rs.next())
            {
                e=new Employee();

                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));

            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }

        return e;

    }

    @Override
    public Employee grtEmployee(String email, String password)
    {
        String query="SELECT * FROM EMP WHERE MAILID=? AND PASSWORD=?";
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try
        {
            ps=con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs=ps.executeQuery();
            while(rs.next())
            {
                e=new Employee();

                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));

            }
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        return e;
    }

    @Override
    public Employee getEmployee(int eid)
    {
        String query="SELECT * FROM EMP WHERE EID=?";
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try
        {
            ps=con.prepareStatement(query);
            ps.setInt(1, eid);
            rs=ps.executeQuery();
            while(rs.next())
            {
                e=new Employee();

                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));

            }
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        return e;

    }

    @Override
    public List getEmployee()
    {
        ArrayList<Employee>emp=new ArrayList<Employee>();
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String query="SELECT * FROM EMP";
        try {
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next())
            {
                e=new Employee();
                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));
                emp.add(e);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return emp;
    }

    @Override
    public boolean updateemployee(Employee e) {

        String query="UPDATE EMP SET FNAME=?,LNAME=?,DOB=?,GENDER=?,JOB=?,MGR=?,DOJ=?,SAL=?,COMM=?,DNO=?,CID=?,PHONE=?,MAILID=?,PASSWORD=?";
        PreparedStatement ps=null;
        int res=0;

        try
        {
            con.setAutoCommit(false);
            ps=con.prepareStatement(query);
            ps.setString(1, e.getFname());
            ps.setString(2,e.getLname());
            ps.setString(3,e.getDOB());
            ps.setString(4,e.getGender());
            ps.setString(5,e.getJob());
            ps.setInt(6,e.getMgr());
            ps.setString(7,e.getDoj());
            ps.setDouble(8,e.getSalary());
            ps.setDouble(9,e.getCommition());
            ps.setInt(10,e.getDno());
            ps.setInt(11,e.getCid());
            ps.setLong(12,e.getPhone());
            ps.setString(13,e.getMail());
            ps.setString(14,e.getPassword());
            res=ps.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        if(res>0)
        {
            try {
                con.commit();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            return true;
        }
        else
        {
            try {
                con.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            return false;
        }
    }

    @Override
    public boolean deleteemployee(Employee e)
    {
        String query="DELETE FROM EMP WHERE EID=?";
        PreparedStatement ps=null;
        int res=0;
        try {
            con.setAutoCommit(false);
            ps=con.prepareStatement(query);
            ps.setInt(1,e.getEid());
            res=ps.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        if(res>0)
        {
            try {
                con.commit();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            return true;
        }
        else
        {
            try {
                con.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            return false;
        }
    }

	@Override
	public List getManager() {

		ArrayList<Employee>emp=new ArrayList<Employee>();
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String query="SELECT * FROM EMP WHERE JOB='MANAGER'";
        try {
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next())
            {
                e=new Employee();
                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));
                emp.add(e);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return emp;
	}

	@Override
	public List getSalesman() {

		ArrayList<Employee>emp=new ArrayList<Employee>();
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String query="SELECT * FROM EMP WHERE JOB='SALESMAN'";
        try {
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next())
            {
                e=new Employee();
                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));
                emp.add(e);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return emp;
		
	}

	@Override
	public List getDetails() {
		 ArrayList<Department>dept=new ArrayList<Department>();
	        Department d=null;
	        PreparedStatement ps=null;
	        ResultSet rs=null;
	        String query="SELECT count(*)as \"count\",E.DNO,D.DNAME FROM EMP E INNER JOIN DEPT D ON E.DNO=D.DNO GROUP BY DNO;";
	        
	        try {
	            ps=con.prepareStatement(query);
	            rs=ps.executeQuery();
	            while (rs.next())
	            {
	                d=new Department();

	                d.setDno(rs.getInt("dno"));
	                d.setDname(rs.getString("dname"));
	                d.setCount(rs.getInt("count"));
	                dept.add(d);
	            }
	        } catch (SQLException ex) {
	            throw new RuntimeException(ex);
	        }
	        return dept;
	}

	@Override

	public boolean UpdateProfile(Employee emp) {
	    String query = "UPDATE emp SET fname = ?, lname = ?, dob = ?, gender = ?, mailid = ?, phone = ? WHERE eid = ?";
	    try (PreparedStatement ps = con.prepareStatement(query)) {
	        ps.setString(1, emp.getFname());
	        ps.setString(2, emp.getLname());
	        ps.setString(3, emp.getDOB());
	        ps.setString(4, emp.getGender());
	        ps.setString(5, emp.getMail());
	        ps.setLong(6, emp.getPhone());
	        ps.setInt(7, emp.getEid());

	        int rowsUpdated = ps.executeUpdate();
	        if (rowsUpdated > 0) {
	            con.commit();
	            return true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            con.rollback();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return false;
	}


	public Employee getEmployee(String mail) {
		String query="SELECT * FROM EMP WHERE MAILID=?";
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try
        {
            ps=con.prepareStatement(query);
            ps.setString(1, mail);
            rs=ps.executeQuery();
            while(rs.next())
            {
                e=new Employee();

                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));

            }
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        return e;
	
	}

	@Override
	public List getTesters() {
		ArrayList<Employee>emp=new ArrayList<Employee>();
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String query="SELECT * FROM EMP WHERE JOB='TESTER'";
        try {
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next())
            {
                e=new Employee();
                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));
                emp.add(e);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return emp;
	}

	@Override
	public List getDeveloper() {
		ArrayList<Employee>emp=new ArrayList<Employee>();
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String query="SELECT * FROM EMP WHERE JOB='Developer'";
        try {
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next())
            {
                e=new Employee();
                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));
                emp.add(e);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return emp;
	}

	@Override
	public List getDispatcher() {
		ArrayList<Employee>emp=new ArrayList<Employee>();
        Employee e=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String query="SELECT * FROM EMP WHERE JOB='Dispatcher'";
        try {
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next())
            {
                e=new Employee();
                e.setEid(rs.getInt("eid"));
                e.setFname(rs.getString("fname"));
                e.setLname(rs.getString("lname"));
                e.setDOB(rs.getString("dob"));
                e.setGender(rs.getString("gender"));
                e.setJob(rs.getString("job"));
                e.setMgr(rs.getInt("mgr"));
                e.setDoj(rs.getString("doj"));
                e.setSalary(rs.getLong("sal"));
                e.setCommition(rs.getLong("comm"));
                e.setDno(rs.getInt("dno"));
                e.setCid(rs.getInt("cid"));
                e.setPhone(rs.getLong("phone"));
                e.setMail(rs.getString("mailid"));
                e.setPassword(rs.getString("password"));
                emp.add(e);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return emp;
	}
}
	

	

