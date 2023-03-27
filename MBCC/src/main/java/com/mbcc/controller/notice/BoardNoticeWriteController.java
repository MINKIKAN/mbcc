package com.mbcc.controller.notice;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.BoardNoticeDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.BoardCommon;


public class BoardNoticeWriteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int fileId=0;
		 String boardTitle = req.getParameter("boardTitle");
	        String boardContent = req.getParameter("boardContent");
	        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
	        System.out.println(req.getParameter("memNum"));
	        int memNum = Integer.parseInt(req.getParameter("memNum"));
	        fileId = Integer.parseInt(req.getParameter("fileId"));
	        if (req.getParameter("fileId").equals(null))
	        {fileId=1;
	        }
	        // fileinfo가 null인 경우에 대한 처리

	        int teamNum = Integer.parseInt(req.getParameter("teamNum"));
	        

	        BoardCommon newNotice = new BoardCommon();
	        newNotice.setBoardType("FREE");
	        newNotice.setBoardTitle(boardTitle);
	        newNotice.setBoardContent(boardContent);
	        newNotice.setCreateDate(currentTime);
	        newNotice.setMemNum(memNum);
	        newNotice.setFileId(fileId);
	      

	        BoardNoticeDAO dao = BoardNoticeDAO.getInstance();
	        dao.writeNewNotice(newNotice);
		return null;
	}

}
