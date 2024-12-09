package com.himedia.tp01.controller;


import com.himedia.tp01.dto.MemberVO;
import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.PlanVO;
import com.himedia.tp01.service.MemberService;
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
    @Autowired
    MemberService ms;

    /* 로그인 여부와 로그인 유저의 일정 생성 여부에 따라 페이지 이동 */
    @GetMapping("/planForm")
    public String planForm(HttpSession session) {
        String url = "";
        if (session.getAttribute("loginUser") == null) {
            // 로그인 창으로 이동
            url = "redirect:/loginForm";
        } else{
            MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
            if (currentMember.getPlan_code() == null || currentMember.getPlan_code().isEmpty()) { // plan_code 가 비어있다면
                /*// plan 생성으로 이동
                url = "redirect:/createPlanForm";*/
                // plan 불러오기 - 테스트코드
                url = "redirect:/roadPlan";
            }else{
                // plan 불러오기
                url = "redirect:/roadPlan";
            }
        }
        return url;
    }

    /* 일정 생성 페이지로 이동 */
    @GetMapping("/createPlanForm")
    public String createPlanForm() {
        return "plan/createPlanForm";
    }

    /* plan을 생성 */
    @PostMapping("/createPlan")
    public ModelAndView createPlan(@ModelAttribute("plan") PlanVO plan, HttpSession session) {
        ModelAndView mav = new ModelAndView();

        // 코드 생성 - 테스트 코드
        String planCode = "qwer";

        // 날짜 입력 - 테스트 코드
        LocalDate startDate = LocalDate.of(2024, 12, 1);
        LocalDate endDate = LocalDate.of(2024, 12, 5);
        System.out.println("startDate : " + startDate);
        System.out.println("endDate : " + endDate);

        // code와 입력한 날짜에 따른 paln 생성
        //ps.setPlan(planCode, startDate, endDate);

        // planCode를 현재 사용자에게 부여
        MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
        //ms.updateMemberPlanCode(currentMember, planCode);

        // 현재 로그인한 유저의 정보를 session 에 저장
        session.setAttribute("loginUser", currentMember);

        return mav;
    }

    /* 로그인 상태이며, plan 이 생성되어 있는 계정이라면 planner 로 이동 */
    @GetMapping("/roadPlan")
    public ModelAndView roadPlan(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        /*if (session.getAttribute("loginUser") == null) {
            // 로그인 창으로 이동
            mav.setViewName("member/loginForm");
        } else {*/
            MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");

            // 현재 사용자 정보로부터 plan_code 불러오기
            //String planCode = currentMember.getPlan_code();
            // 테스트 코드
            String planCode = "qwer";

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
