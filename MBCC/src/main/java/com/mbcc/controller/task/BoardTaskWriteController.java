package com.mbcc.controller.task;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.BoardTaskDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.BoardTask;

public class BoardTaskWriteController implements Controller {

	@Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Form data를 가져오기
	 	String boardType = request.getParameter("boardType");
        String boardTitle = request.getParameter("boardTitle");
        String boardContent = request.getParameter("boardContent");
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        int memNum = Integer.parseInt(request.getParameter("memNum"));
        int fileId = Integer.parseInt(request.getParameter("fileId"));
        
        int responsibleMemNum = Integer.parseInt(request.getParameter("responsibleMemNum"));
        int teamNum = Integer.parseInt(request.getParameter("teamNum"));
        String progress = request.getParameter("progress");

        // BoardTask 객체 생성 및 값 설정
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

        // 데이터베이스에 새로운 작업을 추가
        BoardTaskDAO taskDAO = BoardTaskDAO.getInstance();
        taskDAO.writeNewTask(newTask);

//        // 작업 추가를 확인하고 결과 메시지를 설정합니다.
//        request.setAttribute("resultMessage", "작업이 성공적으로 추가되었습니다.");
//
//        // 페이지를 리다이렉트합니다.
//        RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/mk/main.jsp");
//        dis.forward(request, response);

        return null;
    }
}
