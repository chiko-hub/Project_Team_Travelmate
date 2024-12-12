package com.himedia.tp01.controller;

import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.service.PlanDetailService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class PlanDetailController {
    @Autowired
    PlanDetailService pds;

    /* 겹치는 일정 시간이 없는지 확인하기 */
    @PostMapping("/checkTime")
    public boolean checkTime(){

        return false;
    }

    /* plan 에 세부 계획 추가하기 - AJAX */
    @PostMapping("/addPlan")
    @ResponseBody // JSON 응답을 반환하도록 설정
    public Map<String, Object> addPlan(@ModelAttribute("plandetail") @Valid PlanDetailVO plandetailvo) {
        Map<String, Object> response = new HashMap<>(); // 응답 데이터를 담을 Map

        // 겹치는 일정 시간 확인
        Boolean isCheckTimeResult = pds.checkTime(plandetailvo);

        if (isCheckTimeResult) { // 겹치는 일정이 없다면
            pds.insertPlanDetail(plandetailvo); // 계획 추가
            response.put("success", true);
            response.put("message", "일정이 성공적으로 추가되었습니다.");
        } else { // 겹치는 일정이 있다면
            response.put("success", false);
            response.put("message", "겹치는 일정이 있습니다.");
        }
        return response; // JSON 형태로 반환
    }

    /* 선택한 세부 계획의 값 가져오기 - AJAX */
    @PostMapping("/getPlanDetailForUpdate")
    @ResponseBody
    public Map<String, Object> getPlanDetailForUpdate(@RequestBody Map<String, Integer> requestBody) {
        int planDetailSeq = requestBody.get("planDetailSeq");
        Map<String, Object> response = new HashMap<>(); // 응답 데이터를 담을 Map

        // 세부 계획 정보 가져오기
        PlanDetailVO planDetail = pds.getPlanDetailByPlanDetailSeq(planDetailSeq);

        if (planDetail != null) { // 세부 계획 정보가 있다면
            response.put("success", true);
            response.put("planDetail", planDetail);
        } else { // 세부 계획 정보가 없다면
            response.put("success", false);
            response.put("message", "해당 정보를 불러오지 못했습니다.");
        }
        return response; // JSON 형태로 반환
    }

    /* 세부 일정 수정하기 */
    @PostMapping("/updatePlan")
    @ResponseBody
    public Map<String, Object> updatePlan(@ModelAttribute("plandetail") @Valid PlanDetailVO plandetailvo) {
        Map<String, Object> response = new HashMap<>(); // 응답 데이터를 담을 Map
        System.out.println("기존 세부 일정 : " + plandetailvo);

        // 겹치는 일정 시간 확인
        Boolean isCheckTimeResult = pds.checkTime(plandetailvo);

        if (isCheckTimeResult) { // 겹치는 일정이 없다면
            pds.updatePlanDetail(plandetailvo); // 세부 일정 수정
            response.put("success", true);
            response.put("message", "일정이 성공적으로 수정되었습니다.");
        } else { // 겹치는 일정이 있다면
            response.put("success", false);
            response.put("message", "겹치는 일정이 있습니다.");
        }
        return response; // JSON 형태로 반환
    }

    /* 세부 일정 삭제하기 */
    @PostMapping("/deletePlan")
    @ResponseBody
    public Map<String, Object> deletePlan(@RequestBody Map<String, Integer> requestBody) {
        int planDetailSeq = requestBody.get("planDetailSeq");
        Map<String, Object> response = new HashMap<>(); // 응답 데이터를 담을 Map

        // 세부 계획 정보 가져오기
        PlanDetailVO planDetail = pds.getPlanDetailByPlanDetailSeq(planDetailSeq);

        if (planDetail != null) { // 세부 계획 정보가 있다면
            pds.deletePlanDetail(planDetailSeq); // 일정 삭제
            response.put("success", true);
            response.put("message", "해당 일정을 성공적으로 삭제했습니다.");
        } else { // 세부 계획 정보가 없다면
            response.put("success", false);
            response.put("message", "해당 일정의 정보를 불러오지 못했습니다.");
        }
        return response; // JSON 형태로 반환
    }

}
