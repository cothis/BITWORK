package com.bitwork.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.board.dao.BoardDAO;
import com.bitwork.board.vo.BoardVO;

@WebServlet("/board")
public class BoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>> BoardController doGet()");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// DB 데이터 조회
		List<BoardVO> list = BoardDAO.getList();
		System.out.println("list : " + list);
		
	}
}
