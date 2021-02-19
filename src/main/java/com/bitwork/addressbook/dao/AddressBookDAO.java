package com.bitwork.addressbook.dao;

import com.bitwork.addressbook.vo.AddressBookMapper;
import com.bitwork.common.DBService;
import com.bitwork.common.Paging;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AddressBookDAO {

    public static Map<String, Object> findByCompanyIdx(int companyIdx, String name, int nowPage) {
        try (SqlSession sqlSession = DBService.getFactory().openSession()) {
            AddressBookMapper mapper = sqlSession.getMapper(AddressBookMapper.class);

            Map<String, Object> map = new HashMap<>();
            map.put("companyIdx", companyIdx);
            map.put("name", name);

            int totalRow = mapper.totalRow(map);

            Paging paging = new Paging(totalRow, nowPage, 10, 5);
            map.put("startRow", paging.getStartRow());
            map.put("endRow", paging.getEndRow());

            Map<String, Object> returnMap = new HashMap<>();
            returnMap.put("list", mapper.findByCompanyIdx(map));
            returnMap.put("paging", paging);

            return returnMap;
        }
    }

    public static int deleteByIdxList(List<Integer> list) {
        try (SqlSession sqlSession = DBService.getFactory().openSession(true)) {
            AddressBookMapper mapper = sqlSession.getMapper(AddressBookMapper.class);

            return mapper.deleteByIdxList(list);

        }
    }
}
