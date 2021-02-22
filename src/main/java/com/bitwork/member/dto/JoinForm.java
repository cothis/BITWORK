package com.bitwork.member.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@ToString
public class JoinForm {
    private final String id;
    private final String pw;
    private final String name;
    private final String phone;
    private final String email;
    private final String position;
    private final String fileName;
    private final String oriName;
}
