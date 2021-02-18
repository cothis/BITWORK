package com.bitwork.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.board.dao.BoardDAO;

@WebServlet("/board/delete")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 실행");
		String b_idx = request.getParameter("b_idx");
		System.out.println("b_idx : " + b_idx);
		
		int result = BoardDAO.delete(b_idx);
		System.out.println("삭제 result : " + result);
		
		response.sendRedirect("list");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 실행");
		String c_idx = request.getParameter("c_idx");
		int result = BoardDAO.cmtDelete(c_idx);
		System.out.println("result : " + result);
		
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		
		response.sendRedirect("content?b_idx=" + b_idx + "&cPage=" + cPage);
	}
}
