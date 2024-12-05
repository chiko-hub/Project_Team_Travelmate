package com.himedia.tp01.dao;

import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.PlanVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;

@Mapper
public interface IPlanDao {

    void setPlan(String code, Date startDate, Date endDate); // plan 생성
    PlanVO getPlan(String code); // code 에 해당하는 plan 불러오기

}
