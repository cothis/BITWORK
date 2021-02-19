package com.bitwork.sign.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SignWriteForm {
    private String memberId;
    private String writerName;
    private String docTitle;
    private String docContent;
    private String fileName;
    private String oriName;
}
