package com.mbcc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mbcc.util.MybatisConfig;
import com.mbcc.vo.BoardTask;

public class BoardTaskDAO {
	private BoardTaskDAO() {}
	private static BoardTaskDAO dao=new BoardTaskDAO();
	
	public static BoardTaskDAO getInstance() {return dao;}
	
	public List<BoardTask> getAllTask() {
		SqlSession session=MybatisConfig.getInstance().openSession(true);
		List<BoardTask> list=session.selectList("mapper.boardTask.getAllTask");
		session.close();
		return list;
	}
	
	public void writeNewTask(BoardTask newTask) {
	    SqlSession session = MybatisConfig.getInstance().openSession(true);
	    session.insert("mapper.boardTask.insertBoardCommon", newTask);
	    session.insert("mapper.boardTask.insertBoardTask", newTask);
	    session.close();
	}


}
