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
    private Integer picture;
}
