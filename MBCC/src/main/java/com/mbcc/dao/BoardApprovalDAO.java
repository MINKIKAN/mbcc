package com.mbcc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mbcc.util.MybatisConfig;
import com.mbcc.vo.BoardApproval;

public class BoardApprovalDAO {
	private BoardApprovalDAO() {}
	private static BoardApprovalDAO dao=new BoardApprovalDAO();
	
	public static BoardApprovalDAO getInstance() {return dao;}
	
	public List<BoardApproval> getAllApproval() {
		SqlSession session=MybatisConfig.getInstance().openSession(true);
		List<BoardApproval> list=session.selectList("mapper.boardApproval.getAllApproval");
		session.close();
		return list;
	}
	
	public void writeNewApproval(BoardApproval newTask) {
	    SqlSession session = MybatisConfig.getInstance().openSession(true);
	    session.insert("mapper.boardApproval.insertBoardCommon", newTask);
	    session.insert("mapper.boardApproval.insertBoardApproval", newTask);
	    session.close();
	}

	public void updateBoardApprovalStatus(int boardId, String approvalStatus) {
        SqlSession session = MybatisConfig.getInstance().openSession(true);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("boardId", boardId);
        paramMap.put("progress", approvalStatus);
        session.update("mapper.boardApproval.updateBoardApprovalStatus", paramMap);
        session.close();
    }
	
	public void deleteApproval(int boardId) {
        SqlSession session = MybatisConfig.getInstance().openSession(true);
        try {
            session.delete("mapper.boardApproval.deleteBoardApprovalByBoardId", boardId);
            session.delete("mapper.boardApproval.deleteBoardCommonByBoardId", boardId);
        } 
        catch(Exception e) {
            e.printStackTrace();
        } 
        finally {
            session.close();
        }
    }

}
