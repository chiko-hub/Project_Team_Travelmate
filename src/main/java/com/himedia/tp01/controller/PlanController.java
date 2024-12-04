package com.himedia.tp01.controller;

import com.himedia.tp01.dto.MemberVO;
import com.himedia.tp01.dto.PlanVO;
import com.himedia.tp01.service.PlanService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.List;

@Controller
public class PlanController {

    @Autowired
    PlanService ps;

    @GetMapping("/")
    public String start() {
        return "plan/plan-form";
    }

    /* 로그인 여부 확인 후 planner 로 이동 */
    @GetMapping("/planForm")
    public String planForm(HttpSession session) {
        String url = "member/loginForm";
        if(session.getAttribute("loginUser") == null) {
            // 로그인 알람
        }else{
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
        PlanVO pvo = ps.getPlan(code);

        // plan의 여행 날짜 계산
        List<String> travelLocalDate = ps.getDaysBetweenDates(pvo);

        mav.addObject("travelDateList", travelLocalDate);
        mav.setViewName("plan/plan-form");
        return mav;
    }

}
