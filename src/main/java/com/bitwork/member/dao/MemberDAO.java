package com.bitwork.member.dao;

import com.bitwork.common.DBService;
import com.bitwork.member.dto.JoinForm;
import com.bitwork.member.enumdef.MemberGrade;
import com.bitwork.member.vo.MemberMapper;
import com.bitwork.member.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
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

    public boolean updateCompanyInfo(Integer companyIdx, MemberGrade grade, MemberVO user) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

            Map<String, Object> map = new HashMap<>();
            map.put("companyIdx", companyIdx);
            map.put("grade", grade.ordinal());
            map.put("id", user.getId());

            boolean result = mapper.updateCompanyInfo(map) > 0;
            if (result) {
                user.setCompanyIdx(companyIdx);
                user.setGrade(grade.ordinal());
            }

            return result;
        }
    }

    public List<MemberVO> findMembersByCompanyId(Integer companyIdx) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

            System.out.println("companyIdx = " + companyIdx);


            return mapper.findMembersByCompanyId(companyIdx);
        }
    }

    public List<MemberVO> findListById(String id) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

            return mapper.findListById(id);
        }
    }
}
