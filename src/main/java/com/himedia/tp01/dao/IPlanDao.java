package com.himedia.tp01.dao;

import com.himedia.tp01.dto.PlanVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;

@Mapper
public interface IPlanDao {

    void setPlan(String planCode, Date date, String userid); // plan 생성
    List<PlanVO> getPlan(String planCode); // planCode 에 해당하는 plan 불러오기
    Boolean checkPlanCode(String planCode); // planCode 에 해당하는 plan 이 존재하는지 여부
}
