package com.mbcc.controller.task;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mbcc.dao.BoardTaskDAO;
import com.mbcc.frontController.Controller;

public class BoardTaskChangePgController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int boardId = Integer.parseInt(req.getParameter("boardId"));
        String progress = req.getParameter("progress");
        BoardTaskDAO.getInstance().updateBoardTaskProgress(boardId, progress);

        res.setContentType("text/plain");
        return null;
	}

}
