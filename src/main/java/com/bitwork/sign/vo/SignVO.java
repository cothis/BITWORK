package com.bitwork.sign.vo;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class SignVO {
    private Integer docNo;
    private String docTitle;
    private String memberId;
    private Date insertDate;
    private Date signDate;
    private String docStatus;
    private String docContent;
    private String fileName;
    private String oriName;
    private Integer userRead;
    private Integer bossRead;
    private String writerName;
}
