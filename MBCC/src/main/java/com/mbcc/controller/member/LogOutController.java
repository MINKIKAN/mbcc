package com.mbcc.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mbcc.frontController.Controller;

public class LogOutController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		res.setContentType("text/html; charset=UTF-8");
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		session.removeAttribute("id");
		
		String ctx=req.getContextPath();
		PrintWriter out=res.getWriter();
		
		out.print("\"<script>alert('" + id + "님이 로그아웃하셨습니다'); ");
		
		
		return "redirect:/index.jsp";
	}

}
