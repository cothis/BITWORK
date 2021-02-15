package com.bitwork.company.vo;

import java.util.List;

public interface CompanyMapper {
    List<CompanyVO> findByName(String companyName);
}
