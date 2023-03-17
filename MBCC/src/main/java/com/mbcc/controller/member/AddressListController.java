package com.mbcc.controller.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.memberDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.Member;

public class AddressListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		ArrayList<Member> list=(ArrayList<Member>)memberDAO.getInstance().selectAllUsers();
		req.setAttribute("list", list);
		
		
		
		return "mk/address";
	}

}
