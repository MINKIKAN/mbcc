package com.mbcc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mbcc.util.MybatisConfig;
import com.mbcc.vo.CalVo;

public class calendarDAO {
	
		private calendarDAO() {
		}

		static private calendarDAO dao = new calendarDAO();

		static public calendarDAO getInstance() {
			return dao;

		}

		public void saveSchedule(CalVo cal) {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			session.insert("mapper.calendar.insertCal", cal);
			System.out.println(cal);
			session.close();
		}

		public void deleteCal(int num) {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			session.delete("mapper.calendar.deleteCal", num);
			session.close();
		}

		public List<CalVo> getCal() {
			SqlSession session = MybatisConfig.getInstance().openSession(true);
			List<CalVo> calendarList = session.selectList("mapper.calendar.getCal");
			return calendarList;
		}

	}

