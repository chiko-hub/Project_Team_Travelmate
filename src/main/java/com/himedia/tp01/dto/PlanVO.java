package com.himedia.tp01.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class PlanVO {
    private String code;
    private Date travel_date;
    private int hotel_seq;
    private String hotel_name;
    private String hotel_image;

}
