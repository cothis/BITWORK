package com.bitwork.sign.dao;

import com.bitwork.common.DBService;
import com.bitwork.common.Paging;
import com.bitwork.member.vo.MemberVO;
import com.bitwork.sign.vo.NoReadCount;
import com.bitwork.sign.vo.SignMapper;
import com.bitwork.sign.vo.SignVO;
import com.bitwork.sign.vo.SignWriteForm;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SignDAO {

    public static Map<String, Object> list(int nowPage, String docStatus, MemberVO user) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            SignMapper mapper = sqlSession.getMapper(SignMapper.class);

            Map<String, Object> map = new HashMap<>();
            map.put("docStatus", docStatus);
            map.put("id", user.getId());
            map.put("grade", user.getGrade());

            int totalRow = mapper.totalRow(map);

            Paging paging = new Paging(totalRow, nowPage, 5, 3);
            System.out.println("paging = " + paging);

            map.put("startRow", paging.getStartRow());
            map.put("endRow", paging.getEndRow());
            List<SignVO> list = mapper.findByMap(map);

            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("list", list);
            resultMap.put("paging", paging);

            return resultMap;
        }
    }

    public static int insertDocument(SignWriteForm formData) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            SignMapper mapper = sqlSession.getMapper(SignMapper.class);

            return mapper.insertDocument(formData);
        }

    }

    public static SignVO findByDocNo(int docNo) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            SignMapper mapper = sqlSession.getMapper(SignMapper.class);

            return mapper.findByDocNo(docNo);
        }
    }

    public static int updateSign(int docNo, String sign) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            SignMapper mapper = sqlSession.getMapper(SignMapper.class);

            Map<String, Object> map = new HashMap<>();
            map.put("docNo", docNo);
            map.put("sign", sign);

            return mapper.updateSign(map);
        }
    }

    public static int updateReadStatus(Integer docNo, int grade) {
        //grade 3 이면 USER_READ 1, grade 4이면 BOSS_READ 1
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            SignMapper mapper = sqlSession.getMapper(SignMapper.class);

            Map<String, Object> map = new HashMap<>();
            map.put("docNo", docNo);
            map.put("grade", grade);

            return mapper.updateReadStatus(map);
        }
    }

    public static NoReadCount findNoReadCount(MemberVO user) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            SignMapper mapper = sqlSession.getMapper(SignMapper.class);

            return mapper.noReadCount(user);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
