package com.emp.DTO;

public class Employee
{
    private int eid;
    private String fname;
    private String lname;
    private String DOB;
    private String gender;
    private String job;
    private int mgr;
    private String doj;
    private double salary;
    private double commition;
    private int dno;
    private int cid;
    private long phone;
    private  String mail;
    private String password;

    public Employee(int eid, String fname, String lname, String DOB, String gender, String job, int mgr, String doj, double salary, double commition, int dno, int cid, long phone, String mail, String password)
    {
        this.eid = eid;
        this.fname = fname;
        this.lname = lname;
        this.DOB = DOB;
        this.gender = gender;
        this.job = job;
        this.mgr = mgr;
        this.doj = doj;
        this.salary = salary;
        this.commition = commition;
        this.dno = dno;
        this.cid = cid;
        this.phone = phone;
        this.mail = mail;
        this.password = password;
    }

    public Employee()
    {
        super();
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
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

    public int getMgr() {
        return mgr;
    }

    public void setMgr(int mgr) {
        this.mgr = mgr;
    }

    public String getDoj() {
        return doj;
    }

    public void setDoj(String doj) {
        this.doj = doj;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public double getCommition() {
        return commition;
    }

    public void setCommition(double commition) {
        this.commition = commition;
    }

    public int getDno() {
        return dno;
    }

    public void setDno(int dno) {
        this.dno = dno;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Empoyee{" +
                "eid=" + eid +
                ", fname='" + fname + '\'' +
                ", lname='" + lname + '\'' +
                ", DOB='" + DOB + '\'' +
                ", gender='" + gender + '\'' +
                ", job='" + job + '\'' +
                ", mgr=" + mgr +
                ", doj='" + doj + '\'' +
                ", salary=" + salary +
                ", commition=" + commition +
                ", dno=" + dno +
                ", cid=" + cid +
                ", phone=" + phone +
                ", mail='" + mail + '\'' +
                '}';
    }
}

