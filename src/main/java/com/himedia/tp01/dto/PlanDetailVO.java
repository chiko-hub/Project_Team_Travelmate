package com.himedia.tp01.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class PlanDetailVO {
    private int plan_detail_seq;
    private String plan_code;
    private String plan_date;
    private String category;
    private Timestamp starttime;
    private Timestamp endtime;
}
