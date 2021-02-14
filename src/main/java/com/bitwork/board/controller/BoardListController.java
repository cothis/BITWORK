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

@WebServlet("/boardList")
public class BoardListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>> BoardController doGet()");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String cPage = request.getParameter("cPage");
		Map<String, Integer> map = Paging(cPage, request);
		
		// DB 데이터 조회
		List<BoardVO> list = BoardDAO.getList(map);
		System.out.println("현재 페이지 글 목록(list) : " + list);
		
		
		String result = "{\"list\" : [";
		for (BoardVO vo : list) {
			result += "{";
			result += "\"boardIdx\" : \"" + vo.getBoardIdx() + "\"," ;
			result += "\"subject\" : \"" + vo.getSubject() + "\",";
			result += "\"name\" : \"" + vo.getName() + "\",";
			result += "\"regdate\" : \"" + vo.getRegdate() + "\",";
			result += "\"hit\" : \"" + vo.getHit() + "\"";
			result += "},";
		}
		
		//문자열 맨 마지막 문제 제거하기
		result = result.substring(0, result.length()-1);
		result += "]}";
		System.out.println(result);
		
		//JSON 문자열 출력
		out.print(result);
		
	}
	
	public Map<String, Integer> Paging(String cPage, HttpServletRequest request) {
		// 페이징 처리를 위한 Paging 객체 생성해서 값을 읽고 설정
		PagingVO p = new PagingVO();
		
		// DB 전체 게시물 수 구하기
		p.setTotalRecord(BoardDAO.getTotalCount());
		p.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		// 2. 현재 페이지 구하기
		
		System.out.println("cPage : " + cPage);
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
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
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		request.getSession().setAttribute("pvo", p);
		
		return map;
			
	}
	
}


