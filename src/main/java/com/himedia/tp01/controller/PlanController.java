package com.himedia.tp01.controller;


import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.PlanVO;
import com.himedia.tp01.service.PlanDetailService;
import com.himedia.tp01.service.PlanService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;


@Controller
public class PlanController {
    @Autowired
    PlanService ps;
    @Autowired
    PlanDetailService pds;

    /* 로그인 여부 확인 후 planner 로 이동 */
    @GetMapping("/plan")
    public ModelAndView planForm(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        String url = "member/loginForm";
        /*if (session.getAttribute("loginUser") == null) {
            // 로그인 알람
            //url = "member/loginForm";
        } else {
            MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
            if (currentMember.getPlan_code().isEmpty()) { // plan_code 가 비어있다면*/
                // 코드 생성 - 테스트 코드
                String planCode = "qwer";

                // 날짜 입력 - 테스트 코드
                LocalDate startDate = LocalDate.of(2024, 12, 1);
                LocalDate endDate = LocalDate.of(2024, 12, 5);

                System.out.println("startDate : " + startDate);
                System.out.println("endDate : " + endDate);

                // code와 입력한 날짜에 따른 paln 생성
                //ps.setPlan(planCode, startDate, endDate);
            /*}

            // 현재 사용자 정보로부터 plan_code 불러오기
            MemberVO currentMember = (MemberVO)session.getAttribute("loginUser");
            String code = currentMember.getPlan_code();*/
            // 테스트 코드
            //String code = "qwer";

            // code 에 해당하는 plan 정보 불러오기
            HashMap<String, Object> planHashMap = ps.getPlan(planCode);

            // plan_seq 를 key값으로 하는 plan_detail 정보들 불러오기
            HashMap<Integer, List<PlanDetailVO>> planDetailHashMap =
                    pds.getPlanDetail((int[])planHashMap.get("planSeqArray"));

            mav.addObject("planList", planHashMap.get("planList"));
            mav.addObject("planDetailList", planDetailHashMap);

            mav.setViewName("plan/planForm");
        /*}*/
        return mav;
    }

}
