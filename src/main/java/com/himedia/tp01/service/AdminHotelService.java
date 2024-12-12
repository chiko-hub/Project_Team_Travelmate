package com.himedia.tp01.service;

import com.himedia.tp01.dao.IAdminDao;
import com.himedia.tp01.dao.IAdminHotelDao;
import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.QueryParameter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminHotelService {

    @Autowired
    private IAdminHotelDao ahdao;

    public HashMap<String, Object> adminHotelList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        // 초기화 요청 처리
        if (request.getParameter("first") != null) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }

        // 페이지 처리
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page")); // 요청 파라미터로부터 페이지 값 설정
                session.setAttribute("page", page); // 세션에 저장
            } else if (session.getAttribute("page") != null) {
                Object sessionPage = session.getAttribute("page"); // 세션에서 값 가져오기
                if (sessionPage instanceof Integer) {
                    page = (Integer) sessionPage; // Integer 타입일 경우 그대로 사용
                } else if (sessionPage instanceof String) {
                    page = Integer.parseInt((String) sessionPage); // String 타입일 경우 변환
                }
            }
        } catch (NumberFormatException e) {
            page = 1; // 잘못된 값이 들어온 경우 기본값 설정
        }

        // 검색 키워드 처리
        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        } else if (session.getAttribute("key") != null) {
            Object sessionKey = session.getAttribute("key");
            if (sessionKey instanceof String) {
                key = (String) sessionKey;
            }
        }

        // 페이징 처리
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);

        // QueryParameter 생성
        QueryParameter parameter = new QueryParameter("hotel", "hotel_name", key);

        // getAllCount 호출
        int count = ahdao.getAllCount(parameter);
        System.out.println(count);
        paging.setTotalCount(count);
        paging.calPaging();

        // 데이터 리스트 조회
        List<HotelVO> list = ahdao.getHotelList(paging, key);
        result.put("hotelList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public void insertHotel(HotelVO hotelvo) {
        ahdao.insertHotel( hotelvo );
    }
}
