package com.mbcc.controller.member;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mbcc.dao.memberDAO;
import com.mbcc.vo.Member;
import com.mbcc.frontController.Controller;

public class MemberInsertController implements Controller {
    @Override
    public String requestHandler(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	if(req.getParameter("id") == null) {
    		return "mk/addMember";
    	}
    	return "redirect:/login.do";
    	

        
    }
}
