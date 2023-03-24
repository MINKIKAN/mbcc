package com.mbcc.vo;

public class CalVo {

	private int num;
	private String title;
	private String start;
	private String end;

	public CalVo() {
	};

	public CalVo(int num, String title, String start, String end) {
		super();
		this.num = num;
		this.title = title;
		this.start = start;
		this.end = end;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

}
