package com.bitwork.member.vo;

import com.bitwork.member.dto.JoinForm;

import java.util.Map;

public interface MemberMapper {
    MemberVO findById(String id);

    int addMember(JoinForm joinForm);

    int updateMemberInfo(JoinForm joinForm);

    int deleteMember(Map<String, String> map);
}
