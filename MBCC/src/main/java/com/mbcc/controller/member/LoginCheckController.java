package com.mbcc.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mbcc.dao.memberDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.Member;

public class LoginCheckController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id"); 
		String pw = request.getParameter("pw");
		
		memberDAO dao = memberDAO.getInstance();
		Member mem = new Member();
		mem.setMemId(id);
		mem.setMemPwd(pw);
		
	
		String userid = dao.userLogin(mem);  // 값이 없으면 null 리턴함 
		System.out.println("userid=" + userid);
		
		HttpSession session = request.getSession();
		if(userid!=null) {
			session.setAttribute("id", id);
			
			if(userid.equals("admin")) {
				session.setAttribute("admin", id);
			}
			response.getWriter().print(userid);
		}else {
			System.out.println("암것도 안들어옴");
			response.getWriter().print("null");
		}
		
	

		return null;
	}

}
