package com.mbcc.vo;

public class Task {
	
	private int taskNum;
	private int memNum;
	private int kind;
	private String title;
	private String content;
	private String endDate;
	
	public int getTaskNum() {
		return taskNum;
	}
	public void setTaskNum(int taskNum) {
		this.taskNum = taskNum;
	}
	public int getMemNum() {
		return memNum;
	}
	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
