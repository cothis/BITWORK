package com.bitwork.board.vo;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class BoardVO {
    private Integer boardIdx;
    private String name;
    private String position;
    private Integer status;
    private String subject;
    private String content;
    private String fileName;
    private String oriName;
    private String regdate;
    private Integer hit;
}
