package com.bitwork.commute.dao;

import org.apache.ibatis.session.SqlSession;

import com.bitwork.common.DBService;
import com.bitwork.commute.vo.CommuteVO;

public class CommuteDAO {
	// 이번달 출석 일수 집계
	public static int goodSelect(String memberId) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("commute.thisMonth_good", memberId);
		ss.close();
		return result;
	}
	
	
	// 이번달 지각 일수 집계
	public static int lateSelect(String memberId) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("commute.thisMonth_late", memberId);
		ss.close();
		return result;
	}
	

	// 출석 체크
	public static int inCheck(CommuteVO cvo) {
		try {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("commute.inCheck", cvo);
			ss.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	// 퇴근 체크
		public static int outCheck(CommuteVO cvo) {
			try {
				SqlSession ss = DBService.getFactory().openSession(true);
				int result = ss.update("commute.outCheck", cvo);
				ss.close();
				return result;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		}
}
