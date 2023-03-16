package com.mbcc.vo;

public class BoardTask extends BoardCommon {
	
	private int responsibleMemNum;
    private int teamNum;
    private String progress;
    
    BoardTask(){}
    
	public BoardTask(int responsibleMemNum, int teamNum, String progress) {
		super();
		this.responsibleMemNum = responsibleMemNum;
		this.teamNum = teamNum;
		this.progress = progress;
	}

	public int getResponsibleMemNum() {
		return responsibleMemNum;
	}
	public void setResponsibleMemNum(int responsibleMemNum) {
		this.responsibleMemNum = responsibleMemNum;
	}
	public int getTeamNum() {
		return teamNum;
	}
	public void setTeamNum(int teamNum) {
		this.teamNum = teamNum;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
    
}
