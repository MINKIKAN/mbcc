package com.mbcc.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mbcc.dao.memberDAO;
import com.mbcc.frontController.Controller;


public class checkAdminController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String currId = (String)session.getAttribute("id");
		System.out.println("id ="+ currId);
		String result= memberDAO.getInstance().confirm(currId);
		return result;
	}

}
