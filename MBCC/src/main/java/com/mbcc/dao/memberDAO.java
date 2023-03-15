package com.mbcc.dao;
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
   
   public String checkValidId(String id) {
	   SqlSession session= MybatisConfig.getInstance().openSession(true);
	   String memId=session.selectOne("mapper.member.validId", id);
	   session.close();
	   return memId;
   }
   
   public int addUser(Member member) {
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
   
   public int removeUser(String id) {
	   SqlSession session= MybatisConfig.getInstance().openSession(true);
	   int cnt=session.insert("mapper.member.userDelete", id);
	   session.close();
	   return cnt;
   }
   
}
