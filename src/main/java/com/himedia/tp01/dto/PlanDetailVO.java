package com.himedia.tp01.dto;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class PlanDetailVO {
    private int plan_detail_seq;
    private String plan_seq;
    private String plan_name;
    private Date plan_date;
    private String plan_category;
    private int starttime;
    private int endtime;
}
