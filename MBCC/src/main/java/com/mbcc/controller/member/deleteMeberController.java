package com.mbcc.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.memberDAO;
import com.mbcc.frontController.Controller;

public class deleteMeberController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memNum = req.getParameter("memDelNum");
		
		memberDAO.getInstance().removeUser(Integer.parseInt(memNum));
		
		return null;
	}

}
