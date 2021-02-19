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
    private Integer status;	  // 0->정상, 1->지각
    private Integer good; // 정상출근 카운팅
    private Integer late; // 지각 카운팅
    private Integer total;	  // 총 근무일(정상출근+지각)
    

}
