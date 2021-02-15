package com.bitwork.company.dao;

import com.bitwork.common.DBService;
import com.bitwork.company.vo.CompanyMapper;
import com.bitwork.company.vo.CompanyVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class CompanyDAO {
    public static List<CompanyVO> findByName(String companyName) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            CompanyMapper mapper = sqlSession.getMapper(CompanyMapper.class);
            return mapper.findByName(companyName);
        }
    }
}
