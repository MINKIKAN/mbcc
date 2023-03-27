package com.mbcc.vo;

import java.sql.Timestamp;

public class BoardApproval extends BoardCommon {

	private int requestorMemNum;
    private int approverMemNum;
    private String approvalType;
    private String approvalStatus;
    private Timestamp approvalDate;
    private Timestamp dueDate;
    private String approvalInfo;
	
    public BoardApproval(){}

	public BoardApproval(int requestorMemNum, int approverMemNum, String approvalType, String approvalStatus,
			Timestamp approvalDate, Timestamp dueDate, String approvalInfo) {
		super();
		this.requestorMemNum = requestorMemNum;
		this.approverMemNum = approverMemNum;
		this.approvalType = approvalType;
		this.approvalStatus = approvalStatus;
		this.approvalDate = approvalDate;
		this.dueDate = dueDate;
		this.approvalInfo=approvalInfo;
	}

	public int getRequestorMemNum() {
		return requestorMemNum;
	}

	public void setRequestorMemNum(int requestorMemNum) {
		this.requestorMemNum = requestorMemNum;
	}

	public int getApproverMemNum() {
		return approverMemNum;
	}

	public void setApproverMemNum(int approverMemNum) {
		this.approverMemNum = approverMemNum;
	}

	public String getApprovalType() {
		return approvalType;
	}

	public void setApprovalType(String approvalType) {
		this.approvalType = approvalType;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public Timestamp getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Timestamp approvalDate) {
		this.approvalDate = approvalDate;
	}

	public Timestamp getDueDate() {
		return dueDate;
	}

	public void setDueDate(Timestamp dueDate) {
		this.dueDate = dueDate;
	}

	public String getApprovalInfo() {
		return approvalInfo;
	}

	public void setApprovalInfo(String approvalInfo) {
		this.approvalInfo = approvalInfo;
	}

    
    
}
