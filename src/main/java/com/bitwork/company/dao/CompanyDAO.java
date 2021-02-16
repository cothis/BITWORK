package com.bitwork.company.dao;

import com.bitwork.common.DBService;
import com.bitwork.company.dto.MakeCompanyForm;
import com.bitwork.company.vo.CompanyMapper;
import com.bitwork.company.vo.CompanyVO;
import com.bitwork.member.enumdef.MemberGrade;
import com.bitwork.member.vo.MemberMapper;
import com.bitwork.member.vo.MemberVO;
import com.sun.applet2.AppletParameters;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CompanyDAO {
    public static List<CompanyVO> findByName(String companyName) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            CompanyMapper mapper = sqlSession.getMapper(CompanyMapper.class);
            return mapper.findByName(companyName);
        }
    }

    public static CompanyVO findById(Integer companyIdx) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            CompanyMapper mapper = sqlSession.getMapper(CompanyMapper.class);
            return mapper.findById(companyIdx);
        }
    }

    public static int addCompany(MakeCompanyForm makeCompanyForm, MemberVO user) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            CompanyMapper mapper = sqlSession.getMapper(CompanyMapper.class);
            int result = mapper.addCompany(makeCompanyForm);
            int companyIdx = 0;
            if (result > 0) {
                companyIdx = mapper.currval();
            }

            if (companyIdx > 0) {
                MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

                Map<String, Object> map = new HashMap<>();
                map.put("companyIdx", companyIdx);
                map.put("grade", MemberGrade.BOSS.ordinal());
                map.put("id", user.getId());

                System.out.println("map = " + map);

                int res = memberMapper.updateCompanyInfo(map);
                if (res > 0) {
                    user.setCompanyIdx(companyIdx);
                }
            }
            return companyIdx;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
