package com.mbcc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public void updateBoardTaskProgress(int boardId, String progress) {
        SqlSession session = MybatisConfig.getInstance().openSession(true);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("boardId", boardId);
        paramMap.put("progress", progress);
        session.update("mapper.boardTask.updateBoardTaskProgress", paramMap);
        session.close();
    }
}
