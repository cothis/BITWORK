package com.bitwork.company.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class CompanyVO {
    private Integer companyIdx;
    private String companyName;
    private String companyPhone;
    private String companyEmail;
    private Integer companyEmpCnt;
}
