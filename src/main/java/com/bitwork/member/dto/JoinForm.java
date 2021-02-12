package com.bitwork.member.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class JoinForm {
    private final String id;
    private final String pw;
    private final String name;
    private final Integer picture;
    private final String phone;
    private final String email;
    private final String position;
}
