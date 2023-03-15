package com.mbcc.controller.task;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.TaskDAO;
import com.mbcc.frontController.Controller;
import com.mbcc.vo.Task;


public class TaskController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ArrayList<Task> tlist=(ArrayList<Task>)TaskDAO.getInstance().getAllTask();
		req.setAttribute("tlist", tlist);
		return "mk/task";
	}

}
