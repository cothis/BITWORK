package com.bitwork.commute.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.commute.dao.CommuteDAO;
import com.bitwork.commute.vo.CommuteVO;
import com.bitwork.member.vo.MemberVO;

@WebServlet("/commute/list")
public class CommuteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String startDay;
	String endDay;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 임시 로그인 세션
		MemberVO mvo = new MemberVO();
		mvo.setId("potato");
		mvo.setName("감자");
		mvo.setPosition("부장");
		request.getSession().setAttribute("mvo", mvo);
		
		// 한달간 기록을 조회하기 위해서
		// 오늘 날짜
		Date d = new Date();
		SimpleDateFormat date = new SimpleDateFormat("YYYY/MM/dd");
		String today = date.format(d);
		// 디폴트로 검색창에 넣을 값
		String endDay = today.replace("/", "-");
		
		// 한달 전 날짜
		Calendar mon = Calendar.getInstance();
	    mon.add(Calendar.MONTH , -1);
	    String beforeMonth = new java.text.SimpleDateFormat("YYYY/MM/DD").format(mon.getTime());
	    // 디폴트로 검색창에 넣을 값
	    String startDay = beforeMonth.replace("/", "-");
	    
		Map<String, Object> map = new HashMap<>();
		map.put("endDay", today);
		map.put("startDay", beforeMonth);
		map.put("memberId", mvo.getId());
		
		List<CommuteVO> list = CommuteDAO.getCommuteList(map);
		
		for (CommuteVO cvo : list) {
			if (cvo.getStatus().equals("0")) {
				cvo.setStatus("정상");
			} else {
				cvo.setStatus("지각");
			}
		}
		// 아까 맵에 검색옵션 담아주기
		map.put("end", endDay);
		map.put("start", startDay);
		request.setAttribute("searchOption", map);
		
		request.setAttribute("list",  list);
		
		request.getRequestDispatcher("commuteList.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDay = request.getParameter("startDay").replace("-", "/");
		String endDay = request.getParameter("endDay").replace("-", "/");
		
		System.out.println("startDay : " + startDay);
		System.out.println("endDay : " + endDay);
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		
		Map<String, Object> map = new HashMap<>();
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		map.put("memberId", mvo.getId());
		
		List<CommuteVO> list = CommuteDAO.getCommuteList(map);
		
		for (CommuteVO cvo : list) {
			if (cvo.getStatus().equals("0")) {
				cvo.setStatus("정상");
			} else {
				cvo.setStatus("지각");
			}
		}
		
		map.put("end", request.getParameter("endDay").replace("/", "-"));
		map.put("start", request.getParameter("startDay").replace("/", "-"));
		request.setAttribute("searchOption", map);
		
		request.setAttribute("list",  list);
		
		request.getRequestDispatcher("commuteList.jsp").forward(request, response);
		
	}
	
}
