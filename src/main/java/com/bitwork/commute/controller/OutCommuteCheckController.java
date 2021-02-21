package com.bitwork.commute.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.commute.dao.CommuteDAO;
import com.bitwork.commute.vo.CommuteVO;
import com.bitwork.member.vo.MemberVO;

@WebServlet("/commute/outCheck")
public class OutCommuteCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인한 아이디 불러오기
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		
		// cDate에 넣어줄 오늘 날짜 구하기
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
		
		
		CommuteVO cvo = new CommuteVO();
		cvo.setMemberId(mvo.getId());
		cvo.setCDate(date.format(today));
		
		int result = CommuteDAO.outCheck(cvo);
		System.out.println("result : " + result);
		
		response.getWriter().write(result + "");
	}
	
}
