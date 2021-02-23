package com.bitwork.commute.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.commute.dao.CommuteDAO;
import com.bitwork.commute.vo.CommuteVO;
import com.bitwork.member.vo.MemberVO;

@WebServlet("/commute/main")
public class CommuteMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>> CommuteMainController doGet()");
		
		// 임시 로그인 세션
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("user");

		request.getSession().setAttribute("mvo", mvo);
		
		System.out.println("mvo : " + mvo);
		System.out.println("mvo.getId() : " + mvo.getId());
		
		
		// --------이번달 근태 현황--------
		int good = CommuteDAO.goodSelect(mvo.getId());
		int late = CommuteDAO.lateSelect(mvo.getId());
		
		System.out.println("good : " + good);
		System.out.println("late : " + late);

		CommuteVO cvo = new CommuteVO();
		cvo.setGood(good);
		cvo.setLate(late);
		cvo.setTotal(good + late);
		System.out.println("cvo1 : " + cvo);
		
		// --------오늘 출퇴근 기록 가져오기 --------
		// cDate에 넣어줄 오늘 날짜 구하기
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
		
		Map<String, String> map = new HashMap<>();
		map.put("memberId", mvo.getId());
		map.put("cDate", date.format(today));

		String onTime = CommuteDAO.getOnTime(map);
		String offTime = CommuteDAO.getOffTime(map);
		if (onTime == null) onTime = "00:00:00";
		if (offTime == null) offTime = "00:00:00";
		cvo.setOnTime(onTime);		
		cvo.setOffTime(offTime);
				
		
		request.setAttribute("cvo", cvo);
		
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}
	
	

}
