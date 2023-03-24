package com.mbcc.controller.task;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.BoardTaskDAO;
import com.mbcc.frontController.Controller;

public class BoardTaskDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    int boardId = Integer.parseInt(req.getParameter("boardId"));

	    BoardTaskDAO.getInstance().deleteTask(boardId);

	    return null;
	}


}

