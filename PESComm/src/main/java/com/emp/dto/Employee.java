package com.emp.dto;

public class Employee {
	private int eid;
	private String Fname;
	private String Lname;
	private String DOB;
	private String gender;
	private String job;
	private int MGR;
	private String DOJ;
	private float sal;
	private float comm;
	private int Dno;
	private int cid;
	private String emailid;
	private long phone;
	
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	private String password;
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getFname() {
		return Fname;
	}
	public void setFname(String fname) {
		Fname = fname;
	}
	public String getLnane() {
		return Lname;
	}
	public void setLnane(String lnane) {
		Lname = lnane;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getMGR() {
		return MGR;
	}
	public void setMGR(int mGR) {
		MGR = mGR;
	}
	public String getDOJ() {
		return DOJ;
	}
	public void setDOJ(String dOJ) {
		DOJ = dOJ;
	}
	public float getSal() {
		return sal;
	}
	public void setSal(long sal) {
		this.sal = sal;
	}
	public float getComm() {
		return comm;
	}
	public void setComm(long comm) {
		this.comm = comm;
	}
	public int getDno() {
		return Dno;
	}
	public void setDno(int dno) {
		Dno = dno;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Employee [eid=" + eid + ", Fname=" + Fname + ", LnamSe=" + Lname + ", DOB=" + DOB + ", gender=" + gender
				+ ", job=" + job + ", MGR=" + MGR + ", DOJ=" + DOJ + ", sal=" + sal + ", comm=" + comm + ", Dno=" + Dno
				+ ", cid=" + cid + ", emailid=" + emailid + ", password=" + password + "]";
	}
	
	

}

