package com.mbcc.controller.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.BoardNoticeDAO;
import com.mbcc.dao.memberDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.BoardCommon;
import com.mbcc.vo.BoardFree;
import com.mbcc.vo.Member;

public class noticeShowController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ArrayList<BoardCommon> nlist=(ArrayList<BoardCommon>)BoardNoticeDAO.getInstance().getAllNotice();
		ArrayList<Member> mlist=(ArrayList<Member>)memberDAO.getInstance().selectAllUsers();
	req.setAttribute("nlist", nlist);
	req.setAttribute("mlist", mlist);
		return "mk/Notice";
	}

}
