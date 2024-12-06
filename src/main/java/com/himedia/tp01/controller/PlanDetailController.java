package com.himedia.tp01.controller;

import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.service.PlanDetailService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PlanDetailController {
    @Autowired
    PlanDetailService pds;

    /* plan 에 세부 계획 추가하기 */
    @PostMapping("/addPlan")
    public String addPlan(
            @ModelAttribute("plandetail") @Valid PlanDetailVO plandetailvo) {
        // 테스트 출력 코드
        //System.out.println("plan_seq : " + planSeq);
        System.out.println("plan_detail_seq : " + plandetailvo.getPlan_detail_seq());
        System.out.println("plan_name : " + plandetailvo.getPlan_name());
        System.out.println("plan_seq : " + plandetailvo.getPlan_seq());
        System.out.println("plan_date : " + plandetailvo.getPlan_date());
        System.out.println("category : " + plandetailvo.getPlan_category());
        System.out.println("starttime : " + plandetailvo.getStarttime());
        System.out.println("endtime : " + plandetailvo.getEndtime());

        /* plan에 상세 계획 추가하기 */
        pds.insertPlanDetail(plandetailvo);

        return "redirect:/plan";
    }

}
