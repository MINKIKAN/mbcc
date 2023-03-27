package com.mbcc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mbcc.util.MybatisConfig;
import com.mbcc.vo.BoardCommon;
import com.mbcc.vo.BoardTask;


public class BoardNoticeDAO {
	private BoardNoticeDAO () {}
	private static BoardNoticeDAO dao= new BoardNoticeDAO();
	
	public static BoardNoticeDAO getInstance() {
		return dao;
	}
	
	public List<BoardCommon> getAllNotice() {
		SqlSession session=MybatisConfig.getInstance().openSession(true);
		List<BoardCommon> nList = session.selectList("mapper.boardcommon.getAllNotice");
		session.close();
		return nList;
	}
	
	public void writeNewNotice(BoardCommon newNotice) {
	    SqlSession session = MybatisConfig.getInstance().openSession(true);
	    session.insert("mapper.boardcommon.insertNotice", newNotice);
	    session.close();
	}
	
	public void updateBoardNotice (int boardId, String title,String content) {
        SqlSession session = MybatisConfig.getInstance().openSession(true);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("boardId", boardId);
        paramMap.put("title", title);
        paramMap.put("content", content);
        session.update("mapper.boardcommon.updateBoardCommon", paramMap);
        session.close();
    }
	
	public void deleteNotice(int boardId) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		try {
			session.delete("mapper.boardcommon.deleteBoardCommon", boardId);
		} catch (Exception e) {
			 e.printStackTrace();
		}finally {
			session.close();
		}
	}

}
