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
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("user");
		
		CommuteVO cvo = (CommuteVO) request.getSession().getAttribute("commute");

		int result = CommuteDAO.outCheck(cvo);

		if (result > 0) {
			cvo = CommuteDAO.getCommuteToday(mvo);
			request.getSession().setAttribute("commute", cvo);
		}

		response.getWriter().write(result + "");
	}
	
}
