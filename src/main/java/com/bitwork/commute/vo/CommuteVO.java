package com.bitwork.commute.vo;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class CommuteVO {
    private String memberId;
    private Date cDate;
    private Date onTime;
    private Date offTime;
    private Integer status;
}
