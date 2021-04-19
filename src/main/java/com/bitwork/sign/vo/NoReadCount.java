package com.bitwork.sign.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class NoReadCount {
    private int total;
    private int complete;
    private int refuse;
    private int wait;
}
