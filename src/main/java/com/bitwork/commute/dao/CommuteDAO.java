package com.bitwork.commute.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bitwork.common.DBService;
import com.bitwork.commute.vo.CommuteVO;

public class CommuteDAO {
	
	// 출근 기록현황
	public static String getOnTime(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		String onTime = ss.selectOne("commute.onTimeToday", map);
		ss.close();
		return onTime;
		
	}
	
	// 퇴근 기록현황
	public static String getOffTime(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		String offTime = ss.selectOne("commute.offTimeToday", map);
		ss.close();
		return offTime;
		
	}
		
		
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
	
	// --------------------------------------------------
	// 기간별 데이터 갯수
	public static int getTotalCount (Map<String, Object> map) {
		try {
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("commute.totalCount", map);
			ss.close();
			return totalCount;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	// 기간별 출퇴근 기록 뽑기
	public static List<CommuteVO> getCommuteList(Map<String, Object> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CommuteVO> list = ss.selectList("commute.list",  map);
		ss.close();
		return list;
	}
	
	
	
	
}
