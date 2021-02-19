package com.bitwork.commute.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import com.bitwork.commute.dao.CommuteDAO;
import com.bitwork.commute.vo.CommuteVO;
import com.bitwork.member.vo.MemberVO;

@WebServlet("/commute/OutCheck")
public class OutCommuteCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인한 아이디 불러오기
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		
		String inTime = request.getParameter("time");
		System.out.println("inTime : " + inTime);
		
		int status = 0;
		int inTimeHours = Integer.parseInt(inTime.substring(0, 2));
		
		System.out.println("inTimeHours : " + inTimeHours);
		
		// 9시보다 늦으면
		if (inTimeHours >= 9) {
			status = 1;
		}
		System.out.println("status : " + status);
		
		CommuteVO cvo = new CommuteVO();
		cvo.setMemberId(mvo.getId());
		cvo.setStatus(status);
		
		int result = CommuteDAO.inCheck(cvo);
		System.out.println("result : " + result);
		
		response.getWriter().write(result + "");
	}
	
	
}
