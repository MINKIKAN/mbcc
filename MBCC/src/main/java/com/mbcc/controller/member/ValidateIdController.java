package com.mbcc.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mbcc.dao.memberDAO;
import com.mbcc.frontController.Controller;

public class ValidateIdController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id=request.getParameter("id"); 
		String userId = memberDAO.getInstance().checkValidId(id);
		response.getWriter().print(userId); 

		return null;
	}

}

