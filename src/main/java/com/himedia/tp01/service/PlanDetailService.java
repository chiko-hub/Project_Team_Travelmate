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

    /* plan의 여행 날짜 전부 구하기 */
    public void getDaysBetweenDates(String code, Date startDate, Date endDate) {
        // LocalDate 형식으로 Date 날짜 형변환
        LocalDate localStartDate = startDate.toLocalDate();
        LocalDate localEndDate = endDate.toLocalDate();

        // 두 날짜 사이의 간격 구하기
        Period period = Period.between(localStartDate, localEndDate);
        System.out.println("betweenDays : " + period.getDays());

        PlanDetailVO pdvo = new PlanDetailVO();

        // 반복문을 통해 여행 날짜를 전부 가져와 plan_detail 에 code와 함께 저장하기
        for(int i = 0; i <= period.getDays(); i++) {
            // MM/dd 형식으로 변환해 String 으로 저장
            String date = localStartDate.plusDays(i).format(DateTimeFormatter.ofPattern("MM/dd"));
            System.out.println("date : " + date);
            // code와 함께 날짜 저장
            pddao.setPlanDetailDate(code, date);
        }

    }
}
