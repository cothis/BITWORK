package com.bitwork.member.vo;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class MemberVO {
    private String id;
    private String pw;
    private String name;
    private Integer picture;
    private String phone;
    private String email;
    private String position;
    private Date regdate;
    private Integer companyIdx;
    private Date joindate;
    private Integer grade;
}
