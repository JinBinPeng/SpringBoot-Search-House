package com.pjb.springbootsearchhouse.web.dto;

import lombok.Data;


@Data
public class UserDTO {
    private Long id;
    private String name;
    private String avatar;
    private String phoneNumber;
    private String lastLoginTime;
}
