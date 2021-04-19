package com.bitwork.addressbook.vo;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class AddressBookVO {
    private Integer addressbookIdx;
    private String name;
    private String phone;
    private String email;
    private String company;
    private Integer companyIdx;

    public AddressBookVO(String name, String phone, String email, String company, Integer companyIdx) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.company = company;
        this.companyIdx = companyIdx;
    }
}

