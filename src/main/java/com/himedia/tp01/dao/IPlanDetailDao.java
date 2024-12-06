package com.himedia.tp01.dao;

import com.himedia.tp01.dto.PlanDetailVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IPlanDetailDao {

    List<PlanDetailVO> getPlanDetail(int planSeq); // planSeq 로 planDetail 가져오기
    void insertPlanDetail(PlanDetailVO plandetail); // 상세 계획 추가하기
}
