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
import java.util.List;

@Service
public class PlanDetailService {

    @Autowired
    IPlanDetailDao pddao;

    /* code 에 해당하는 plan_detail 불러오기 */
    public List<PlanDetailVO> getPlanDetail(String code) {
        List<PlanDetailVO> planDetailList = pddao.getPlanDetail(code);
        return planDetailList;
    }

}
