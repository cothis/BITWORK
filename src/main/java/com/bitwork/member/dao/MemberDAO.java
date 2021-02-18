package com.bitwork.member.dao;

import com.bitwork.common.DBService;
import com.bitwork.common.Paging;
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

    public Map<String, Object> findMembersByCompanyId(Integer companyIdx, String name, String page, Map<String, Object> result) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            Map<String, Object> map = new HashMap<>();
            map.put("companyIdx", companyIdx);
            map.put("name", name);

            int totalRow = mapper.getTotalRowByMap(map);

            Paging paging = new Paging(totalRow, Integer.parseInt(page));

            List<MemberVO> employees = mapper.findMembersByCompanyId(map);

            result.put("employees", employees);
            result.put("paging", paging);
            return result;
        }
    }

    public List<MemberVO> findInvitable(String id) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

            return mapper.findInvitable(id);
        }
    }

    public List<MemberDAO> findApplyList(int companyIdx) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

            return mapper.findApplyList(companyIdx);
        }
    }

    public int updateGrade(Map<String, Object> map) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            return mapper.updateGrade(map);
        }
    }

    public int inviteMember(Integer companyIdx, String id) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            Map<String, Object> parameterMap = new HashMap<>();
            parameterMap.put("companyIdx", companyIdx);
            parameterMap.put("id", id);
            return mapper.inviteMember(parameterMap);
        }
    }
}
