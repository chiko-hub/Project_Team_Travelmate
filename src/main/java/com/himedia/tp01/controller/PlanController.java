package com.himedia.tp01.controller;

import com.himedia.tp01.dto.MemberVO;
import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.PlanVO;
import com.himedia.tp01.service.PlanDetailService;
import com.himedia.tp01.service.PlanService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.List;


@Controller
public class PlanController {

    @Autowired
    PlanService ps;
    @Autowired
    PlanDetailService pds;

    /* 로그인 여부 확인 후 planner 로 이동 */
    @GetMapping("/planForm")
    public String planForm(HttpSession session) {
        String url = "member/loginForm";
        if(session.getAttribute("loginUser") == null) {
            // 로그인 알람

        }else{
            MemberVO currentMember = (MemberVO)session.getAttribute("loginUser");
            if(currentMember.getPlan_code().isEmpty()) { // plan_code 가 비어있다면
                // 코드 생성 - 테스트 코드
                String code = "qwer";

                // 날짜 입력 - 테스트 코드
                Date startDate = new Date(2024, 12, 01);
                Date endDate = new Date(2024, 12, 10);

                // code와 입력한 날짜에 따른 paln 생성
                ps.setPlan(code, startDate, endDate);

                // plan의 여행 날짜 계산 - 생성 최초 1회
                pds.getDaysBetweenDates(code, startDate, endDate);

            }
            url = "planner";
        }
        return url;
    }

    /* 코드에 맞는 plan 불러오기 */
    @GetMapping("/planner")
    public ModelAndView planner(HttpSession session, Model model) {
        ModelAndView mav = new ModelAndView();

        // 현재 사용자 정보로부터 plan_code 불러오기
        //MemberVO currentMember = (MemberVO)session.getAttribute("loginUser");
        //String code = currentMember.getPlan_code();
        String code = "qwer"; // 테스트코드

        // code 에 해당하는 plan 불러오기
        PlanVO plan = ps.getPlan(code);
        // code 에 해당하는 plan_detail 불러오기
        List<PlanDetailVO> planDetailList = pds.getPlanDetail(code);

        mav.addObject("plan", plan);
        mav.addObject("planDetailList", planDetailList);
        mav.setViewName("plan/plan-form");
        return mav;
    }

}
