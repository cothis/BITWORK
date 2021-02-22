package com.bitwork.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.board.dao.BoardDAO;
import com.bitwork.board.vo.BoardVO;
import com.bitwork.board.vo.CommentsVO;

@WebServlet("/board/content")
public class BoardContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String b_idx = request.getParameter("b_idx");
		
		BoardDAO.updateHit(Integer.parseInt(b_idx));

		BoardVO bvo = BoardDAO.selectOne(b_idx);	
		request.getSession().setAttribute("bvo", bvo);
		
		if (bvo.getFileName() != null) {
			String fileName = bvo.getFileName();
			String fileType = "";
			int i = fileName.lastIndexOf(".");
			if (i > 0) {
				fileType = fileName.substring(i + 1);
			}
			
			boolean isImage = false;
			
			if (fileType.equals("jpg") || fileType.equals("png") || fileType.equals("jpeg")) {
				isImage = true;
			}
			
			request.setAttribute("isImage", isImage);
		}
		
		// 댓글 가져오기
		List<CommentsVO> cvo = BoardDAO.getCmtList(b_idx);
		request.setAttribute("cvo", cvo);
		
		
		request.getRequestDispatcher("boardContent.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
