package com.himedia.tp01.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class MemberVO {
    @NotEmpty
    private String userid;
    @NotEmpty
    private	String pwd;
    @NotEmpty
    private String name;
    @NotEmpty
    private String email;
    @NotEmpty
    private String phone;
    private String zip_num;
    private String address_main;
    private String address_detail;
    private String address_extra;
    private Timestamp indate;
    private String provider;
    private String plan_code;

}
