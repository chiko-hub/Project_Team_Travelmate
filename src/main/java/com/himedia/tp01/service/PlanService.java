package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlanDao;
import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.PlanVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;


@Service
public class PlanService {

    @Autowired
    IPlanDao pdao;

    /* code, startdate, enddate 를 입력하여 plan 생성 */
    public void setPlan(String code, Date startDate, Date endDate) {
        pdao.setPlan(code, startDate, endDate);
    }

    /* code 에 해당하는 plan 불러오기 */
    public PlanVO getPlan(String code) {
        return pdao.getPlan(code);
    }


}
