package com.bitwork.commute.controller;

import java.io.IOException;

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
		MemberVO mvo = new MemberVO();
		mvo.setId("potato");
		mvo.setName("감자");
		mvo.setPosition("부장");
		
		request.getSession().setAttribute("mvo", mvo);
		
		System.out.println("mvo : " + mvo);
		System.out.println("mvo.getId() : " + mvo.getId());
		
		int good = CommuteDAO.goodSelect(mvo.getId());
		int late = CommuteDAO.lateSelect(mvo.getId());
		
		System.out.println("good : " + good);
		System.out.println("late : " + late);
		
		CommuteVO cvo = new CommuteVO();
		cvo.setGood(good);
		cvo.setLate(late);
		cvo.setTotal(good + late);
		
		request.setAttribute("cvo", cvo);
		
		request.getRequestDispatcher("commuteMain.jsp").forward(request, response);
	}
	
	

}
