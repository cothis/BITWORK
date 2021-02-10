package com.bitwork.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import com.bitwork.board.vo.BoardVO;
import com.bitwork.common.DBService;

public class BoardDAO {
	
	// 게시판 전체글 조회
	public static List<BoardVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList(")
	}
	

}
