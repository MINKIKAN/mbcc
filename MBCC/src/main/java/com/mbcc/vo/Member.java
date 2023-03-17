package com.mbcc.vo;

import java.util.Date;

public class Member extends teamVo {
	
	private int memNum;
    private String memId;
    private String memPwd;
    private String memName;
    private String memImg;
    private String gender;
    private String birthday;
    private Date empDate;
    private String email;
    private String tel;
    private int teamNum;
    private int empType;
    private int vacation;
    private int salary;
    private String role;
    
    public Member(){}
    
	public Member(int memNum, String memId, String memPwd, String memName, String memImg, String gender,
			String birthday, Date empDate, String email, String tel, int teamNum, int empType, int vacation, int salary,
			String role) {
		super();
		this.memNum = memNum;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memImg = memImg;
		this.gender = gender;
		this.birthday = birthday;
		this.empDate = empDate;
		this.email = email;
		this.tel = tel;
		this.teamNum = teamNum;
		this.empType = empType;
		this.vacation = vacation;
		this.salary = salary;
		this.role = role;
	}

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemImg() {
		return memImg;
	}

	public void setMemImg(String memImg) {
		this.memImg = memImg;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public Date getEmpDate() {
		return empDate;
	}

	public void setEmpDate(Date empDate) {
		this.empDate = empDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getTeamNum() {
		return teamNum;
	}

	public void setTeamNum(int teamNum) {
		this.teamNum = teamNum;
	}

	public int getEmpType() {
		return empType;
	}

	public void setEmpType(int empType) {
		this.empType = empType;
	}

	public int getVacation() {
		return vacation;
	}

	public void setVacation(int vacation) {
		this.vacation = vacation;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
