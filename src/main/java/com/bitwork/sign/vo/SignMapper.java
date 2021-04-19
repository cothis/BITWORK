package com.bitwork.sign.vo;

import com.bitwork.member.vo.MemberVO;

import java.util.List;
import java.util.Map;

public interface SignMapper {

    int totalRow(Map<String, Object> map);

    List<SignVO> findByMap(Map<String, Object> map);

    int insertDocument(SignWriteForm formData);

    SignVO findByDocNo(int docNo);

    int updateSign(Map<String, Object> map);

    int updateReadStatus(Map<String, Object> map);

    NoReadCount noReadCount(MemberVO user);
}
