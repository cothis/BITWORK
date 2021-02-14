package com.bitwork.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bitwork.board.vo.BoardVO;
import com.bitwork.common.DBService;

public class BoardDAO {
	
	// 게시글 전체 건수 조회
	
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("board.totalCount");
		ss.close();
		return totalCount;
	}
	
	// 게시판 전체글 조회
	public static List<BoardVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("board.list", map);
		ss.close();
		return list;
	}
	
	// 게시글 번호에 해당하는 게시글 하나 조회
	public static BoardVO selectOne(String boardIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		BoardVO vo = ss.selectOne("board.one", boardIdx);
		ss.close();
		return vo;
	}

}
