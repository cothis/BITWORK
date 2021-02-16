package com.bitwork.company.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MakeCompanyForm {
    private String companyName;
    private String companyPhone;
    private String companyEmail;
}
