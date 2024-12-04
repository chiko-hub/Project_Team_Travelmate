package com.himedia.tp01.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class PlanVO {
    private String code;
    private Date plan_startdate;
    private Date plan_enddate;
    private int hotel_seq;
    private String hotel_name;
    private String hotel_image;

}
