package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlanDetailDao;
import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.PlanVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class PlanDetailService {

    @Autowired
    IPlanDetailDao pddao;

    /* planCode 로 planDetail 가져오기 */
    public HashMap<Integer, List<PlanDetailVO>> getPlanDetail(int[] planSeqArray) {
        HashMap<Integer, List<PlanDetailVO>> planDetailHashMap = new HashMap<>();
        List<PlanDetailVO> planDetailList = new ArrayList<>();
        // plan_seq 를 기준으로 planDetail 받아오기
        for(int i = 0; i < planSeqArray.length; i++) {
            planDetailList = pddao.getPlanDetail(planSeqArray[i]); // starttime 기준 오름차순
            planDetailHashMap.put(planSeqArray[i], planDetailList);
            System.out.println("planSeqArray[i] 에 따른 planDetailList 목록 : " + planDetailHashMap.get(planSeqArray[i]));
        }
        return planDetailHashMap;
    }

    /* plan에 상세 계획 추가하기 */
    public void insertPlanDetail(PlanDetailVO plandetail) {
        pddao.insertPlanDetail(plandetail);
    }

}
