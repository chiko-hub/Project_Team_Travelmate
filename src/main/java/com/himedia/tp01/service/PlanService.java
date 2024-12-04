package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlanDao;
import com.himedia.tp01.dto.PlanVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class PlanService {

    @Autowired
    IPlanDao pdao;

    /* code 에 해당하는 plan 불러오기 */
    public PlanVO getPlan(String code) {
        return pdao.getPlan(code);
    }

    /* plan의 여행 날짜 전부 구하기 */
    public List<String> getDaysBetweenDates(PlanVO pvo) {
        List<String> travelLocalDate = new ArrayList<>();

        // LocalDate 형식으로 날짜 값 가져오기
        LocalDate startDate = pvo.getPlan_startdate().toLocalDate();
        LocalDate endDate = pvo.getPlan_enddate().toLocalDate();

        // 두 날짜 사이의 간격 구하기
        Period period = Period.between(startDate, endDate);
        System.out.println("betweenDays : " + period.getDays());

        // 반복문을 통해 여행 시작 날짜부터 끝 날짜까지 전부 가져오기
        for(int i = 0; i <= period.getDays(); i++) {
            // MM/dd 형식으로 변환해 String 으로 저장
            travelLocalDate.add(startDate.plusDays(i).format(DateTimeFormatter.ofPattern("MM/dd")));
        }

        return travelLocalDate;
    }

}
