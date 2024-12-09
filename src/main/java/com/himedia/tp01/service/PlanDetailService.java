package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlanDetailDao;
import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.PlanVO;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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

    /* 겹치는 일정이 있는지 확인하기 */
    public Boolean checkTime(@Valid PlanDetailVO plandetailvo) {
        int newStarttime = plandetailvo.getStarttime(); // 새로운 계획의 시작 시간
        int newEndtime = plandetailvo.getEndtime(); // 새로운 계획의 끝 시간
        Set<Integer> newTimeSet = new TreeSet<>(); // 새로운 계획이 차지하는 모든 시간을 담는 set

        // 새로운 계획이 차지하는 모든 시간 담기
        for(int newTime = newStarttime; newTime < newEndtime; newTime++){
            newTimeSet.add(newTime);
        }

        // plan_seq를 기준으로 기존에 저장되어 있던 planDetail 가져오기
        List<PlanDetailVO> planDetailList = pddao.getPlanDetail(plandetailvo.getPlan_seq());

        // 가져온 planDetail 전부 조사
        for(PlanDetailVO planDetail : planDetailList) {
            int existingStarttime = planDetail.getStarttime(); // 기존 계획의 시작 시간
            int existingEndtime = planDetail.getEndtime(); // 기존 계획의 끝 시간
            Set<Integer> existingTimeSet = new TreeSet<>(); // 기존의 계획이 차지하는 모든 시간을 담는 set

            // 기존 계획이 차지하는 모든 시간 담기
            for(int existingTime = existingStarttime; existingTime < existingEndtime; existingTime++) {
                existingTimeSet.add(existingTime);
            }

            // 겹치는 시간을 비교할 새로운 Set으로 합집합 생성
            Set<Integer> resultSet = Stream.concat(newTimeSet.stream(), existingTimeSet.stream())
                    .collect(Collectors.toSet());

            // 겹치는 시간이 있어 size가 맞지 않으면
            if(resultSet.size() != (newTimeSet.size() + existingTimeSet.size())) return false;
        }
        return true;
    }

    /* plan에 상세 계획 추가하기 */
    public void insertPlanDetail(PlanDetailVO plandetail) {
        pddao.insertPlanDetail(plandetail);
    }

}
