package com.mbcc.controller.approval;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.BoardApprovalDAO;
import com.mbcc.dao.memberDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.BoardApproval;
import com.mbcc.vo.Member;

public class BoardApprovalController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ArrayList<BoardApproval> alist=(ArrayList<BoardApproval>)BoardApprovalDAO.getInstance().getAllApproval();
		ArrayList<Member> mlist=(ArrayList<Member>)memberDAO.getInstance().selectAllUsers();
		req.setAttribute("alist", alist);
		req.setAttribute("mlist", mlist);
		return "mk/approval";
	}

}
