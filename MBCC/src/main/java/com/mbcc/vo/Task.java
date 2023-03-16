package com.mbcc.vo;

import java.sql.Timestamp;

public class Task {
	
	private int boardId;
    private String boardType;
    private int memNum;
    private String title;
    private String content;
    private Timestamp createDate;
    private Timestamp updateDate;
    private int viewCount;
    private Integer responsibleMemNum;
    private Integer teamNum;
    private String progress;

    public Task() {}
    
	public Task(int boardId, String boardType, int memNum, String title, String content, Timestamp createDate,
			Timestamp updateDate, int viewCount, Integer responsibleMemNum, Integer teamNum, String progress) {
		super();
		this.boardId = boardId;
		this.boardType = boardType;
		this.memNum = memNum;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.viewCount = viewCount;
		this.responsibleMemNum = responsibleMemNum;
		this.teamNum = teamNum;
		this.progress = progress;
	}


	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
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

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Integer getResponsibleMemNum() {
		return responsibleMemNum;
	}

	public void setResponsibleMemNum(Integer responsibleMemNum) {
		this.responsibleMemNum = responsibleMemNum;
	}

	public Integer getTeamNum() {
		return teamNum;
	}

	public void setTeamNum(Integer teamNum) {
		this.teamNum = teamNum;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}
    
    
}
