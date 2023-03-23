package com.mbcc.controller.task;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.BoardTaskDAO;
import com.mbcc.dao.memberDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.BoardTask;
import com.mbcc.vo.Member;


public class BoardTaskController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ArrayList<BoardTask> tlist=(ArrayList<BoardTask>)BoardTaskDAO.getInstance().getAllTask();
		ArrayList<Member> mlist=(ArrayList<Member>)memberDAO.getInstance().selectAllUsers();
		req.setAttribute("tlist", tlist);
		req.setAttribute("mlist", mlist);
		return "mk/task";
	}

}
