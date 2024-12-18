package com.himedia.tp01.dao;

import com.himedia.tp01.dto.PlanDetailVO;
import jakarta.validation.Valid;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IPlanDetailDao {

    List<PlanDetailVO> getPlanDetail(int planSeq); // planSeq 로 planDetail 가져오기
    void insertPlanDetail(PlanDetailVO planDetail); // 새로운 planDetail 추가하기
    PlanDetailVO getPlanDetailByPlanDetailSeq(int planDetailSeq); // planDetailSeq 로 planDetail 가져오기
    void updatePlanDetail(@Valid PlanDetailVO planDetail); // planDetail 수정하기
    void deletePlanDetail(int planDetailSeq); // planDetail 삭제하기
}
