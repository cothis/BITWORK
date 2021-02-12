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

    public MemberVO(String id, String pw, String name, Integer picture, String phone, String email, String position) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.picture = picture;
        this.phone = phone;
        this.email = email;
        this.position = position;
    }
}
