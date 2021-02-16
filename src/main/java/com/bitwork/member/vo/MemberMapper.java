package com.bitwork.member.vo;

import com.bitwork.member.dto.JoinForm;

import java.util.List;
import java.util.Map;

public interface MemberMapper {
    MemberVO findById(String id);

    int addMember(JoinForm joinForm);

    int updateMemberInfo(JoinForm joinForm);

    int deleteMember(Map<String, String> map);

    int updateCompanyInfo(Map<String, Object> parameterMap);

    List<MemberVO> findMembersByCompanyId(Integer companyIdx);

    List<MemberVO> findListById(String id); // mapper만들기
}
