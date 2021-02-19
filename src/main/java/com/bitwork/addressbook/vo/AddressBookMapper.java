package com.bitwork.addressbook.vo;

import java.util.List;
import java.util.Map;

public interface AddressBookMapper {
    List<AddressBookVO> findByCompanyIdx(Map<String, Object> map);

    int totalRow(Map<String, Object> map);

    int deleteByIdxList(List<Integer> list);
}
