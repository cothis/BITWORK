package com.bitwork.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.board.dao.BoardDAO;
import com.bitwork.board.vo.CommentsVO;
import com.bitwork.board.vo.PagingVO;
import com.bitwork.member.vo.MemberVO;

@WebServlet("/board/comments")
public class BoardCommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 로그인된 세션 정보
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		
		CommentsVO cvo = new CommentsVO();
		cvo.setMemberId(mvo.getId());
		
		System.out.println("전달받은 로그인 아이디 : " + cvo.getMemberId());
		
		cvo.setCmtContent(request.getParameter("content"));
		cvo.setBoardIdx(Integer.parseInt(request.getParameter("b_idx")));
		
		
		System.out.println("댓글 입력한거 : " + cvo);
		int result = BoardDAO.insertCmt(cvo);
		
	
		PagingVO pvo = (PagingVO) request.getSession().getAttribute("pvo");
		response.sendRedirect("content?b_idx=" + cvo.getBoardIdx() + "&cPage=" + pvo.getNowPage());
		 
	}
	
	
}
