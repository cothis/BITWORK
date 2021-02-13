package com.bitwork.member.vo;

import lombok.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Date;
import java.util.stream.Stream;

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
    private String phone;
    private String email;
    private String position;
    private Date regdate;
    private Integer companyIdx;
    private Date joindate;
    private Integer grade;
    private String fileName;
    private String oriName;
}
