package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlanDao;
import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.PlanVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Random;


@Service
public class PlanService {

    @Autowired
    IPlanDao pdao;

    /* code, startdate, enddate 를 입력하여 여행 날짜 전부 구해 plan 생성 */
    public void setPlan(String planCode, LocalDate startDate, LocalDate endDate, String userid) {
        // 두 날짜 사이의 간격 구하기
        Period period = Period.between(startDate, endDate);

        // 반복문을 통해 여행 날짜를 전부 가져와 plan_detail 에 code와 함께 저장하기
        for(int i = 0; i <= period.getDays(); i++) {
            // 날짜를 하루씩 구해 Date 로 저장
            Date date = Date.valueOf(startDate.plusDays(i));
            // code와 함께 날짜 저장
            pdao.setPlan(planCode, date, userid);
        }
    }

    /* code 에 해당하는 plan 과 plan의 plan_seq 불러오기 */
    public HashMap<String, Object> getPlan(String planCode) {
        HashMap<String, Object> planHashMap = new HashMap<>();
        // plan 정보 모두 받아오기
        List<PlanVO> planList = pdao.getPlan(planCode);

        int[] planSeqArray = new int[planList.size()]; // plan_seq만 따로 받을 배열
        // plan 의 plan_seq만 따로 저장
        for(int i = 0; i < planSeqArray.length; i++) {
            planSeqArray[i] = planList.get(i).getPlan_seq();
        }

        planHashMap.put("planList", planList);
        planHashMap.put("planSeqArray", planSeqArray);
        return planHashMap;
    }

    /* 10자리 랜덤 문자열 생성 */
    public String getRandomString() {
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        int strLength = str.length();

        Random random = new Random();

        String result = "";

        // 10자리의 랜덤한 문자열을 생성
        for (int i = 0; i < 10; i++) {
            result += str.charAt((int)Math.floor(Math.random() * strLength));
        }

        return result;
    }

    /* planCode 에 맞는 plan 이 생성되어 있는지 확인 */
    public Boolean checkPlanCode(String planCode) {
        return pdao.checkPlanCode(planCode);
    }
}
