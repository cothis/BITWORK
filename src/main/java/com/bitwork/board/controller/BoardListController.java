package com.bitwork.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitwork.board.dao.BoardDAO;
import com.bitwork.board.vo.BoardVO;
import com.bitwork.board.vo.PagingVO;
import com.bitwork.member.vo.MemberVO;

@WebServlet("/board/list")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String search_option;
	String keyword;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>> BoardController doGet()");
		
		// 임시 로그인 세션
		MemberVO mvo = new MemberVO();
		mvo.setId("onion");
		mvo.setName("양파");
		mvo.setPosition("사원");
		
		System.out.println("mvo : " + mvo);
		
		request.getSession().setAttribute("mvo", mvo);
		
		
		// 검색할 때 옵션이랑 키워드
		search_option = request.getParameter("search_option");
		keyword = request.getParameter("keyword");
		
		String cPage = request.getParameter("cPage");
		Map<String, Object> map = Paging(cPage, request);
		
		// DB 데이터 조회
		List<BoardVO> list = BoardDAO.getList(map);
		System.out.println("현재 페이지 글 목록(list) : " + list);
		
		for (BoardVO bvo : list) {
			if (bvo.getCmtCount().equals("0")) {
				bvo.setCmtCount("");
			} else {
				bvo.setCmtCount(" [" + bvo.getCmtCount() + "]");
			}
		}
		

		
		
		request.setAttribute("list",  list);
		
		request.getRequestDispatcher("boardList.jsp").forward(request, response);
		
	}
	
	public Map<String, Object> Paging(String cPage, HttpServletRequest request) {
		// 페이징 처리를 위한 Paging 객체 생성해서 값을 읽고 설정
		PagingVO p = new PagingVO();
	
		
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		
		// DB 전체 게시물 수 구하기
		p.setTotalRecord(BoardDAO.getTotalCount(map));
		p.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		// 2. 현재 페이지 구하기
		
		System.out.println("cPage : " + cPage);
		if (cPage == null || cPage.length() == 0) {
			cPage = "1";
		} 
		p.setNowPage(Integer.parseInt(cPage));
		
		
		// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당 글수
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1); 
		
		// ----- 블록(block) 계산하기 -----
		// 4. 블록의 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
		// 시작페이지 구하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		// 4-1. 끝페이지(endPage)가 전체 페이지수(totalPage) 보다 크면
		// 끝페이지 값을 전체페이지수로 변경처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		System.out.println(">> 시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println(">> 끝페이지(endPage) : " + p.getEndPage());
		
		// =====================================
		// 현재 페이지 기준으로 DB데이터(게시글) 가져오기
		// 시작글번호, 끝글번호 저장용 Map 만들기(전달할 파라미터 저장용)
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		request.getSession().setAttribute("search", map);				
		request.getSession().setAttribute("pvo", p);
		
		return map;
			
	}
	
}


