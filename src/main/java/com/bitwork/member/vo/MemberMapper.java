package com.bitwork.member.vo;

import com.bitwork.member.dto.JoinForm;

public interface MemberMapper {
    MemberVO findById(String id);

    int addMember(JoinForm joinForm);

    int updateMemberInfo(JoinForm joinForm);
}
