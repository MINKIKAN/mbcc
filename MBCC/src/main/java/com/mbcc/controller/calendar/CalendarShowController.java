package com.mbcc.controller.calendar;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.CalVo;
import com.mbcc.dao.calendarDAO;

public class CalendarShowController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 List<CalVo> calendarList = calendarDAO.getInstance().getCal();
	        if (calendarList.size() == 0) {
	            return null;
	        }
	        System.out.println("test" + calendarList.get(0).getStart());
	        String json = new Gson().toJson(calendarList);
	        res.setContentType("application/json");
	        res.setCharacterEncoding("UTF-8");
	        res.getWriter().write(json);
	        System.out.println(json);
	        return null;
	    }

	}


