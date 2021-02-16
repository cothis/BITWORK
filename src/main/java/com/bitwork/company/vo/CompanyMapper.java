package com.bitwork.company.vo;

import com.bitwork.company.dto.MakeCompanyForm;

import java.util.List;

public interface CompanyMapper {
    List<CompanyVO> findByName(String companyName);

    CompanyVO findById(Integer companyIdx);

    int addCompany(MakeCompanyForm makeCompanyForm);

    int currval();
}
