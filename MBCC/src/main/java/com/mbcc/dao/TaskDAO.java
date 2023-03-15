package com.mbcc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mbcc.util.MybatisConfig;
import com.mbcc.vo.Task;

public class TaskDAO {
	private TaskDAO() {}
	private static TaskDAO dao=new TaskDAO();
	
	public static TaskDAO getInstance() {return dao;}
	
	public List<Task> getAllTask() {
		SqlSession session=MybatisConfig.getInstance().openSession(true);
		List<Task> list=session.selectList("mapper.task.getAllTask");
		session.close();
		return list;
	}
}
