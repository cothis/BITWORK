package com.bitwork.commute.vo;

import lombok.*;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class CommuteVO {
    private String memberId;
    private String cDate;
    private String onTime = "00:00:00";
    private String offTime = "00:00:00";
    private String status;	  // 0->정상, 1->지각
    private Integer good; // 정상출근 카운팅
    private Integer late; // 지각 카운팅
    private Integer total;	  // 총 근무일(정상출근+지각)
    

}
