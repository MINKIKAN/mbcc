package com.mbcc.controller.task;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.BoardTaskDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.BoardTask;

public class BoardTaskWriteController implements Controller {

	@Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	String boardType = request.getParameter("boardType");
        String boardTitle = request.getParameter("boardTitle");
        String boardContent = request.getParameter("boardContent");
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        int memNum = Integer.parseInt(request.getParameter("memNum"));
        int fileId = Integer.parseInt(request.getParameter("fileId"));
        int responsibleMemNum = Integer.parseInt(request.getParameter("responsibleMemNum"));
        int teamNum = Integer.parseInt(request.getParameter("teamNum"));
        String progress = request.getParameter("progress");

        BoardTask newTask = new BoardTask();
        newTask.setBoardType(boardType);
        newTask.setBoardTitle(boardTitle);
        newTask.setBoardContent(boardContent);
        newTask.setCreateDate(currentTime);
        newTask.setMemNum(memNum);
        newTask.setFileId(fileId);
        newTask.setResponsibleMemNum(responsibleMemNum);
        newTask.setTeamNum(teamNum);
        newTask.setProgress(progress);

        BoardTaskDAO taskDAO = BoardTaskDAO.getInstance();
        taskDAO.writeNewTask(newTask);

        return null;
    }
}
