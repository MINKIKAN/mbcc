package com.mbcc.vo;

public class teamVo {
  
	private int teamNum;
	private String teamName;
	
	public teamVo(){}

	public teamVo(int teamNum, String teamName) {
		super();
		this.teamNum = teamNum;
		this.teamName = teamName;
	}

	public int getTeamNum() {
		return teamNum;
	}

	public void setTeamNum(int teamNum) {
		this.teamNum = teamNum;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	
	
	
}
