package com.mbcc.frontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.do")
public class MbccFrontController extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		System.out.println("프론트컨트롤 들어옴");
		String url=req.getRequestURI();
		System.out.println("url=" + url); 
		String ctx=req.getContextPath();
		System.out.println("frontcon ctx="+ctx);
		String command=url.substring(ctx.length());
		System.out.println("command=" + command); 
		Controller controller=null;
		String currId=(String)session.getAttribute("id");
	
		System.out.println("현재 접속 id="+currId);

		String nextPage=null;
	    HandlerMapping mapping=new HandlerMapping();
	    controller=mapping.getController(command);
	    
	    nextPage=controller.requestHandler(req, res);

	
		if(nextPage!=null) {
			if(nextPage.indexOf("redirect:")!=-1) {
				res.sendRedirect( ctx+ nextPage.split(":")[1]); 
			}else {
				RequestDispatcher rd=req.getRequestDispatcher(ViewResolver.makeView(nextPage)); 
				rd.forward(req, res);
			}
		}		
	}
}
