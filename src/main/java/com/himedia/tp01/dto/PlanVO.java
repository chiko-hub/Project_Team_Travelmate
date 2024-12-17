package com.himedia.tp01.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class PlanVO {
    private int plan_seq;
    private String plan_code;
    private Date travel_date;
    private String make_userid;
    private int hotel_seq;
    private String hotel_name;
    private String hotel_image;

}
