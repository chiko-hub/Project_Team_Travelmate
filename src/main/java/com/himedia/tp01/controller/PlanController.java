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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
                // plan 생성으로 이동
                url = "redirect:/createPlanForm";
            }else{
                // plan 불러오기
                url = "redirect:/loadPlan";
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
    public String createPlan(@RequestParam String datefilter, HttpSession session) {
        String url = "";
        if(session.getAttribute("loginUser") == null) {
            url = "redirect:/loginForm";
        }else{
            // 코드 생성
            String planCode = ps.getRandomString();

            // 날짜 변환 - datefilter를 '~' 기준으로 나누기
            String[] dates = datefilter.split("~");

            // 문자열을 LocalDate로 변환
            LocalDate startDate = LocalDate.parse(dates[0].trim());
            LocalDate endDate = LocalDate.parse(dates[1].trim());

            // code와 입력한 날짜에 따른 paln 생성
            MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
            ps.setPlan(planCode, startDate, endDate, currentMember.getUserid());

            // planCode를 현재 사용자에게 부여
            ms.updateMemberPlanCode(currentMember.getUserid(), planCode);
            currentMember = ms.getMember(currentMember.getUserid());

            // 코드가 부여된 현재 로그인한 유저의 정보를 session 에 저장
            session.setAttribute("loginUser", currentMember);
            url = "redirect:/loadPlan";
        }
        return url;
    }

    /* 로그인 상태이며, plan 이 생성되어 있는 계정이라면 planner 로 이동 */
    @GetMapping("/loadPlan")
    public ModelAndView loadPlan(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        if (session.getAttribute("loginUser") == null) {
            // 로그인 창으로 이동
            mav.setViewName("member/loginForm");
        } else {
            MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");

            // 현재 사용자 정보로부터 plan_code 불러오기
            String planCode = currentMember.getPlan_code();

            // code 에 해당하는 plan 정보 불러오기
            HashMap<String, Object> planHashMap = ps.getPlan(planCode);

            // plan_seq 를 key값으로 하는 plan_detail 정보들 불러오기
            HashMap<Integer, List<PlanDetailVO>> planDetailHashMap =
                    pds.getPlanDetail((int[])planHashMap.get("planSeqArray"));

            mav.addObject("planList", planHashMap.get("planList"));
            mav.addObject("planDetailList", planDetailHashMap);

            mav.setViewName("plan/planForm");
        }
        return mav;
    }

    /* planCode 를 입력하여 plan 을 불러오기 */
    @PostMapping("/loadPlanByCode")
    @ResponseBody // JSON 응답을 반환하도록 설정
    public Map<String, Object> loadPlanByCode(@RequestBody String planCode, HttpSession session) {
        Map<String, Object> response = new HashMap<>(); // 응답 데이터를 담을 Map

        // planCode 에 해당하는 plan이 존재하는지 여부
        Boolean isCheckPlanCodeResult = ps.checkPlanCode(planCode);

        if (isCheckPlanCodeResult) { // plan 이 존재한다면
            // planCode를 현재 사용자에게 부여
            MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
            ms.updateMemberPlanCode(currentMember.getUserid(), planCode);
            currentMember = ms.getMember(currentMember.getUserid());

            // 새로운 코드가 부여된 현재 로그인한 유저의 정보를 session 에 저장
            session.setAttribute("loginUser", currentMember);

            // 성공 메시지를 담기
            response.put("success", true);
            response.put("message", "일정을 성공적으로 불러왔습니다.");
        } else { // plan 이 존재하지 않는다면
            // 실패 메시지 담기
            response.put("success", false);
            response.put("message", "해당되는 일정이 없습니다.");
        }
        return response; // JSON 형태로 반환
    }
}
