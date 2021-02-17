package com.bitwork.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.board.dao.BoardDAO;
import com.bitwork.board.dto.BoardUpdateForm;
import com.bitwork.board.vo.BoardVO;
import com.bitwork.member.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");

		BoardVO bvo = BoardDAO.selectOne(b_idx);	
		request.setAttribute("bvo", bvo);
		request.setAttribute("cPage", cPage);
		
		// 기존 제목
		String subject = bvo.getSubject();
		
		if (bvo.getStatus() == 0) {
			subject = subject.replace("[공지] ", "");
		}
		
		bvo.setSubject(subject);
		
		request.getRequestDispatcher("boardUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 doPost실행");
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		 
		String path = request.getServletContext().getRealPath("data/board");
		File folder = new File(path);
		if (!folder.exists()) {
		 folder.mkdirs();
		}
		
		MultipartRequest mr = new MultipartRequest(request, path, (1024 * 1024 * 10), "UTF-8", new DefaultFileRenamePolicy());
		// 페이지 정보 값들
		String b_idx = mr.getParameter("b_idx");
		System.out.println("b_idx : " + b_idx);
		String cPage = mr.getParameter("cPage");
		System.out.println("cPage : " + cPage);
		
		String option = mr.getParameter("update_option");
		String subject = mr.getParameter("update_subject");
		
		// 공지 선택하면 앞에 문자열 붙여줌
		if (option.equals("0")) { 
		 subject = "[공지] " + subject;
		}
		
		System.out.println("subject: " + subject);
		
		String content = mr.getParameter("update_content");
		String fileName = "";
		String oriName = "";
	
		int deleteState = 0;
		
		if (mr.getOriginalFileName("update_file") != null)	 {
			fileName = mr.getFilesystemName("update_file");
			oriName = mr.getOriginalFileName("update_file");
		} else if(mr.getParameter("update_file").equals("delete"))  {
			fileName = "";
			oriName = "";
		} else {
			//TODO
			deleteState = 1; 
		}
		
		BoardUpdateForm updateForm = new BoardUpdateForm(Integer.parseInt(b_idx), Integer.parseInt(option), subject, content, fileName, oriName);
		
		
		int result = BoardDAO.update(updateForm);
		
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		response.getWriter().write(result + "");
		
	}
}
