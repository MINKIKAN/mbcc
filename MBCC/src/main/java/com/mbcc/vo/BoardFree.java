package com.mbcc.vo;

public class BoardFree extends BoardCommon {

	private int viewCount; //조회수 
	
	public BoardFree(){}

	public BoardFree(int viewCount) {
		super();
		this.viewCount = viewCount;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
}
