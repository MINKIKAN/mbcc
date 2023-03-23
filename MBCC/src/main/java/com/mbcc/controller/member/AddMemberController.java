package com.mbcc.controller.member;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mbcc.frontController.Controller;
import com.mbcc.dao.memberDAO;
import com.mbcc.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 30)

public class AddMemberController implements Controller {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads/";

    @Override
    public String requestHandler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String UPLOAD_DIR="img";                               
		String saveFolder=request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		File isDir = new File(saveFolder);  // 이미 있는 img 경로 받아오기 

		if(!isDir.isDirectory()){
			System.out.println("디렉토리가 없습니다. 디렉토리를 새로 생성합니다.");
			isDir.mkdir();
		}

		   int maxSize =  1024*1024*5;  // 5mb 
		   String encType="utf-8";
		   MultipartRequest multi = null;
		   try{
			   multi = new MultipartRequest(request,saveFolder, maxSize , encType, new DefaultFileRenamePolicy());
        String memberId = multi.getParameter("id");
        String password = multi.getParameter("pw");
        String name = multi.getParameter("name");
        String gender = multi.getParameter("gender");
        String birthDate = multi.getParameter("birthday");
        String empDate = multi.getParameter("empDate");
        String email = multi.getParameter("email");
        String phone = multi.getParameter("tel");
        int teamNum = Integer.parseInt(multi.getParameter("teamNum"));
        int empType = Integer.parseInt(multi.getParameter("empType"));
        int vacation=Integer.parseInt("120");
        int salary=Integer.parseInt("10000");
        String role = multi.getParameter("role");
        
        System.out.println(multi.getParameter("id"));
        System.out.println(multi.getParameter("pw"));
        System.out.println(multi.getParameter("name"));
        System.out.println(multi.getParameter("gender"));
        System.out.println(multi.getParameter("birthday"));
        System.out.println(multi.getParameter("empDate"));

        
        String photo = null;
        String photoPart = multi.getParameter("photoFile");
        String orginFileName = multi.getOriginalFileName("uploadFile"); // 우리가 업로드한 파일이름 
		   String fileType = multi.getContentType("uploadFile"); // 파일의 타입 .txt , jpg , .png 
		   System.out.println(" 파일 저장된 정보 = " + saveFolder);
		   System.out.println("실제 파일명 = "+ photoPart);
		   System.out.println("저장 파일명 = "+ orginFileName);
		   System. out.println("파일 종류  = "+ fileType);
        response.setCharacterEncoding("utf-8"); //응답 스프링에 한글 파일 이름 있으면 깨짐 방지
//		File file = multi.getFile("uploadFile"); 
//		if(file != null){
//
//				response.getWriter().print(photoPart);
//		}else {
//			
//			response.getWriter().print("fail");
//		}
        Member vo = new Member();
        vo.setMemId(memberId);
        vo.setMemPwd(password);
        vo.setMemName(name);
        vo.setMemImg(photoPart);
        vo.setGender(gender);
        vo.setBirthday(birthDate);
        vo.setEmpDate(empDate);
        vo.setEmail(email);
        vo.setTel(phone);
        vo.setTeamNum(teamNum);
        vo.setEmpType(empType);
        vo.setVacation(vacation);
        vo.setSalary(salary);
        vo.setRole(role);
       

        
        int result = memberDAO.getInstance().addUser(vo);
        if (result == 1) {
        	System.out.println("회원가입 성공");
            return "redirect:/login.do";
        } else {
            return "error.jsp";
        }
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   return "redirect:/login.do";
    }
}
