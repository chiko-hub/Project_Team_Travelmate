package com.himedia.tp01.dao;

import com.himedia.tp01.dto.PlanDetailVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IPlanDetailDao {

    List<PlanDetailVO> getPlanDetail(String code); // code 에 해당하는 plan 불러오기
    void setPlanDetailDate(String code, String date); // code 와 함께 날짜 저장
}
