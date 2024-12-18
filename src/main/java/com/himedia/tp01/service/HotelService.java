package com.himedia.tp01.service;

import com.himedia.tp01.dao.IHotelDao;
import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.Paging;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class HotelService {

    @Autowired
    IHotelDao hdao;

    /* request 에 맞는 hotelList 정보 가져오기 */
    public HashMap<String, Object> selectHotelList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        HashMap<String, Object> result = new HashMap<>();
        int count = 0; // 총 페이지 수 담을 count
        List<HotelVO> hotelList = null; // 장소 목록 담을 list

        // 'first' 파라미터가 ture 일 경우 page, key 세션 초기화 및 hotelCategory 세션 저장
        if (Boolean.parseBoolean(request.getParameter("first"))) {
            session.removeAttribute("page");
            session.removeAttribute("key");
            session.setAttribute("hotelCategory", request.getParameter("hotelCategory"));
        }

        // 페이지 번호 처리
        int page = Integer.parseInt(request.getParameter("page"));
        if (page == 1 && session.getAttribute("page") != null) {
            page = (Integer)session.getAttribute("page"); // 세션에서 page 값 가져오기
        }
        session.setAttribute("page", page);

        // 페이징 처리
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(6);
        paging.setDisplayRow(6);

        // 검색 키워드 처리
        String key = request.getParameter("key");
        if ("".equals(key) && session.getAttribute("key") != null) {
            key = (String)session.getAttribute("key"); // 세션에서 key 값 가져오기
        }
        session.setAttribute("key", key);

        // 카테고리 처리
        String hotelCategory = request.getParameter("hotelCategory");
        if (session.getAttribute("hotelCategory") != null) {
            hotelCategory = (String)session.getAttribute("hotelCategory"); // 세션에서 hotelCategory 값 가져오기
        }

        // 카테고리에 따른 데이터 처리
        if ("best".equals(hotelCategory)) { // hotelCategory 가 best 이라면
            count = hdao.getBestCount("hotel", "hotel_name", key);
            paging.setTotalCount(count);
            paging.calPaging();
            hotelList = hdao.getBestHotel(paging, key); // BEST 장소 목록 가져오기
        } else if ("hot".equals(hotelCategory)) { // hotelCategory 가 hot 이라면
            count = hdao.getHotCount("hotel", "hotel_name", key);
            paging.setTotalCount(count);
            paging.calPaging();
            hotelList = hdao.getHotHotel(paging, key); // HOT 장소 목록 가져오기
        } else { // hotelCategory.equals("all") hotelCategory 가 all 이라면
            count = hdao.getAllCount("hotel", "hotel_name", key);
            paging.setTotalCount(count);
            paging.calPaging();
            hotelList = hdao.getAllHotelList(paging, key); // 모든 장소 목록 가져오기
        }
        result.put("hotelList", hotelList);
        result.put("paging", paging);
        result.put("key", key);
        result.put("hotelCategory", hotelCategory);
        return result;
    }

    public HotelVO getHotel(int hotel_seq) {
        return hdao.getHotel(hotel_seq);
    }

}
