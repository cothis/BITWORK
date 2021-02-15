package com.bitwork.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bitwork.board.vo.BoardVO;
import com.bitwork.board.vo.CommentsVO;
import com.bitwork.common.DBService;

public class BoardDAO {
	
	// 게시글 전체 건수 조회
	public static int getTotalCount(Map<String, Object> map) {
		try {
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("board.totalCount", map);
			ss.close();
			return totalCount;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	// 게시판 리스트 조회
	public static List<BoardVO> getList(Map<String, Object> map) {
		SqlSession ss = DBService.getFactory().openSession();
		try {
			List<BoardVO> list = ss.selectList("board.list", map);			
			ss.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 게시글 번호에 해당하는 게시글 하나 조회
	public static BoardVO selectOne(String boardIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		BoardVO vo = ss.selectOne("board.one", boardIdx);
		ss.close();
		return vo;
	}
	
	// =============== 댓글관련 ===============
		// 댓글 목록 조회
		public static List<CommentsVO> getCmtList(String boardIdx) {
			SqlSession ss = DBService.getFactory().openSession();
			List<CommentsVO> cmt_list = ss.selectList("board.cmtList", boardIdx);
			ss.close();
			
			return cmt_list;
		}

}
