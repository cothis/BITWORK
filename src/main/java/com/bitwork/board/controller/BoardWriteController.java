package com.bitwork.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.board.dao.BoardDAO;
import com.bitwork.board.dto.BoardWriteForm;
import com.bitwork.board.vo.PagingVO;
import com.bitwork.member.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("/board/write")
public class BoardWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("boardWrite.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 // 페이지 1페이지로 돌려주기 
		 PagingVO pvo = (PagingVO) request.getSession().getAttribute("pvo");
		 pvo.setNowPage(1);
		 
		 // 로그인된 세션 정보
		 MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		 
		 String path = request.getServletContext().getRealPath("data/board");
		 
		 // 세션에 파일 경로 저장
		 request.setAttribute("path", path);
		 
		 File folder = new File(path);
		 if (!folder.exists()) {
			 folder.mkdirs();
		 }
		 
		 MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
		 
		 String option = mr.getParameter("write_option");
		 String subject = mr.getParameter("write_subject");
		 
		 // 공지 선택하면 앞에 문자열 붙여줌
		 if (option.equals("0")) { 
			 subject = "[공지] " + subject;
		 }
		 
		 String content = mr.getParameter("write_content");
		 String fileName = mr.getFilesystemName("write_file");
		 String oriName = mr.getOriginalFileName("write_file");
		 
		 BoardWriteForm writeForm = new BoardWriteForm(mvo.getId(), Integer.parseInt(option), subject, content, fileName, oriName);
		 
		 int result = BoardDAO.insert(writeForm);
		 
		 response.setContentType("application/json;charset=UTF-8");
		 response.setHeader("Access-Control-Allow-Origin", "*");
		 
		 response.getWriter().write(result + "");
		 
	}
	
}
