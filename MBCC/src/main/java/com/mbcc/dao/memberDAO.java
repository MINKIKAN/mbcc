package com.mbcc.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.mbcc.util.MybatisConfig;
import com.mbcc.vo.Member;

public class memberDAO {
   private memberDAO() {} 
   
   private static memberDAO dao= new memberDAO();
   
   public static memberDAO getInstance() {
		return dao;
	}
   
   public String userLogin(Member member) {
	   
	   SqlSession session= MybatisConfig.getInstance().openSession(true);
	   String memId=session.selectOne("mapper.member.userLogin", member);
	   session.close();
	   return memId;
   }
   
   public List<Member> selectAllUsers() {
	   SqlSession session=MybatisConfig.getInstance().openSession(true);
	   List<Member> mList=session.selectList("mapper.member.selectAllUsers");
	   return mList;
	    
   }
   
   public String checkValidId(String id) {
	   SqlSession session= MybatisConfig.getInstance().openSession(true);
	   String memId=session.selectOne("mapper.member.validId", id);
	   session.close();
	   return memId;
   }
   
   public int addUser(Member member) {
	   System.out.println("test2");
	   SqlSession session= MybatisConfig.getInstance().openSession(true);
	   int cnt=session.insert("mapper.member.userInsert", member);
	   session.close();
	   return cnt;
   }
   public Member getOneUser(String id) {
	   SqlSession session= MybatisConfig.getInstance().openSession(true);
	   Member member = session.selectOne("mapper.member.getOneUser",id);
	   session.close();
	   return member;
   }

   
   public int userUpdate(Member member) {
	   SqlSession session= MybatisConfig.getInstance().openSession(true);
	   int cnt= session.update("mapper.member.userUpdate",member);
	   session.close();
	   return cnt;
   }
   
   public int removeUser(int num) {
	   SqlSession session= MybatisConfig.getInstance().openSession(true);
	   int delMemNum=session.insert("mapper.member.userDelete", num);
	   session.close();
	   return delMemNum;
   }
   
   public String confirm(String id) {
	    SqlSession session = MybatisConfig.getInstance().openSession(true);
	    int count = session.selectOne("mapper.member.isAdminOrUser", id);
	    if (count>0) {
			return "true";
		}
	    return "false";   
  }
}
