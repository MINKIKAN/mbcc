package com.mbcc.controller.approval;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.BoardApprovalDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.BoardApproval;

public class BoardApprovalWriteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("안녕하세요 이곳은 어프루벌 라이트 컨트롤러입니다.");
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		long dueTimeMillis = currentTime.getTime() + (7 * 24 * 60 * 60 * 1000);
		Timestamp dueTime = new Timestamp(dueTimeMillis);
		
		String approvalInfo = req.getParameter("approvalInfo");
		String boardContent = req.getParameter("boardContent");
		String boardType = req.getParameter("boardType");
        String boardTitle = req.getParameter("boardTitle");
        int memNum = Integer.parseInt(req.getParameter("memNum"));
        int fileId = Integer.parseInt(req.getParameter("fileId"));
        
        int requestorMemNum = Integer.parseInt(req.getParameter("requestorMemNum"));
        int approverMemNum = Integer.parseInt(req.getParameter("approverMemNum"));
        String approvalType = req.getParameter("approvalType");
        String approvalStatus = req.getParameter("approvalStatus");
        
        System.out.println(approvalInfo);
        System.out.println(boardContent);
        System.out.println(boardType);
        System.out.println(boardTitle);
        System.out.println(memNum);
        System.out.println(fileId);
        System.out.println(requestorMemNum);
        System.out.println(approverMemNum);
        System.out.println(approvalType);
        System.out.println(approvalStatus);

        BoardApproval newApproval = new BoardApproval();
        newApproval.setBoardType(boardType);
        newApproval.setBoardTitle(boardTitle);
        newApproval.setBoardContent(boardContent);
        newApproval.setCreateDate(currentTime);
        newApproval.setMemNum(memNum);
        newApproval.setFileId(fileId);
        
        newApproval.setRequestorMemNum(requestorMemNum);
        newApproval.setApproverMemNum(approverMemNum);
        newApproval.setApprovalType(approvalType);
        newApproval.setApprovalStatus(approvalStatus);
        newApproval.setApprovalDate(currentTime);
        newApproval.setDueDate(dueTime);
        newApproval.setApprovalInfo(approvalInfo);

        BoardApprovalDAO approvalDAO = BoardApprovalDAO.getInstance();
        approvalDAO.writeNewApproval(newApproval);
		return null;
	}

}
