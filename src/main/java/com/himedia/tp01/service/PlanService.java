package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlanDao;
import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.PlanVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;


@Service
public class PlanService {

    @Autowired
    IPlanDao pdao;

    /* code, startdate, enddate 를 입력하여 여행 날짜 전부 구해 plan 생성 */
    public void setPlan(String code, Date startDate, Date endDate) {
        // LocalDate 형식으로 Date 날짜 형변환
        LocalDate localStartDate = startDate.toLocalDate();
        LocalDate localEndDate = endDate.toLocalDate();

        // 두 날짜 사이의 간격 구하기
        Period period = Period.between(localStartDate, localEndDate);
        System.out.println("betweenDays : " + period.getDays());

        // 반복문을 통해 여행 날짜를 전부 가져와 plan_detail 에 code와 함께 저장하기
        for(int i = 0; i <= period.getDays(); i++) {
            // 날짜를 하루씩 구해 Date 로 저장
            Date date = Date.valueOf(localStartDate.plusDays(i));
            System.out.println("date : " + date); // 임시 출력
            // code와 함께 날짜 저장
            pdao.setPlan(code, date);
        }
    }

    /* code 에 해당하는 plan 불러오기 */
    public PlanVO getPlan(String code) {
        return pdao.getPlan(code);
    }

}
