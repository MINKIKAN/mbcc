package com.mbcc.controller.calendar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.calendarDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.CalVo;

public class CalendarInsertController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 String title = req.getParameter("title");
	        String start = req.getParameter("start");
	        String end = req.getParameter("end");
	        
	        CalVo c = new CalVo(1, title, start, end);
	        calendarDAO.getInstance().saveSchedule(c);
	        return null;

	}

}
