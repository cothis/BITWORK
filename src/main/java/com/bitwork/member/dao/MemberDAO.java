package com.bitwork.member.dao;

import com.bitwork.common.DBService;
import com.bitwork.member.dto.JoinForm;
import com.bitwork.member.enumdef.MemberGrade;
import com.bitwork.member.vo.MemberMapper;
import com.bitwork.member.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.Map;

public class MemberDAO {
    public MemberVO findById(String id) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            return mapper.findById(id);
        }
    }

    public int addMember(JoinForm joinForm) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            return mapper.addMember(joinForm);
        }
    }

    public int updateMemberInfo(JoinForm joinForm) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            return mapper.updateMemberInfo(joinForm);
        }
    }

    public int deleteMember(Map<String, String> map) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            return mapper.deleteMember(map);
        }
    }

    public boolean updateCompanyInfo(Map<String, Object> map) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            return mapper.updateCompanyInfo(map) > 0;
        }
    }
}
