package com.bitwork.commute.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bitwork.member.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;

import com.bitwork.common.DBService;
import com.bitwork.common.Paging;
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

	// 오늘의 출근 상태 by cothis
	public static CommuteVO getCommuteToday(MemberVO user) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			CommuteVO cvo = ss.selectOne("commute.getToday", user);
			if (cvo == null) {
				cvo = new CommuteVO();
				Date today = new Date();
				SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");

				cvo.setCDate(date.format(today));
				cvo.setMemberId(user.getId());
			}
			return cvo;
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
	public static Map<String, Object> getCommuteList(String startDay, String endDay, String memberId, int nowPage) {
		SqlSession ss = DBService.getFactory().openSession();
				
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startDay", startDay);
		paramMap.put("endDay", endDay);
		paramMap.put("memberId", memberId);
		paramMap.put("nowPage", nowPage);
		
		int totalCount = ss.selectOne("commute.totalCount", paramMap);
		Paging paging = new Paging(totalCount, nowPage, 2, 2);
		paramMap.put("startRow", paging.getStartRow());
		paramMap.put("endRow", paging.getEndRow());
		
		System.out.println(paging);
		
		List<CommuteVO> list = ss.selectList("commute.list",  paramMap);
		for (CommuteVO comVo : list) {
			if (comVo.getStatus().equals("0")) {
				comVo.setStatus("정상");
			} else {
				comVo.setStatus("지각");
			}
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		resultMap.put("paging", paging);
		ss.close();
		return resultMap;
	}	
}
