package com.mbcc.vo;

import java.util.Date;

public class Member {
	private int memNum;
	private String memId;
	private String memPwd;
	private String gender;
	private String memName;
	private String birthday;
	private Date empDate;
	private String email;
	private String tel;
	private int empTeam;
    private int empType;
	private int vacation;
	private String memImg;
	private int salary;

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
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

	public void setEmDate(Date emDate) {
		this.empDate = emDate;
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
	public int getEmpTeam() {
		return empTeam;
	}

	public void setEmpTeam(int empTeam) {
		this.empTeam = empTeam;
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

	public String getMemImg() {
		return memImg;
	}

	public void setMemImg(String memImg) {
		this.memImg = memImg;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {

		return super.toString();
	}

}
