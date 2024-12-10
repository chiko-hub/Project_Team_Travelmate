package com.himedia.tp01.service;

import com.himedia.tp01.dao.IHotelDao;
import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
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

//    public HashMap<String, Object> selectBestHotList() {
//        HashMap<String, Object> result = new HashMap<>();
//        List<HotelVO> bestList = hdao.selectBestList();
//        List<HotelVO> hotList = hdao.selectHotList();
//        result.put("bestList", bestList);
//        result.put("hotList", hotList);
//        return result;
//    }

    public HashMap<String, Object> selectAllList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if( request.getParameter("first")!=null){
            session.removeAttribute("page");
            session.removeAttribute("key"); }
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page")); // 요청에서 page 값 가져오기
            } else if (session.getAttribute("page") != null) {
                page = (Integer) session.getAttribute("page"); // 세션에서 page 값 가져오기
            }
        } catch (NumberFormatException | ClassCastException e) { page = 1; } // 유효하지 않은 값이 있으면 기본값으로 설정
        session.setAttribute("page", page); // 세션에 현재 페이지 저장
        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key"); // 요청에서 key 값 가져오기
        } else if (session.getAttribute("key") != null) {
            key = (String) session.getAttribute("key"); }// 세션에서 key 값 가져오기
        session.setAttribute("key", key); // 세션에 검색 키워드 저장
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(5);
        paging.setDisplayRow(5);
        int count = hdao.getAllCount("hotel", "hotel_name", key);
        paging.setTotalCount(count);
        paging.calPaging();
        List<HotelVO> hotelList = hdao.getAllHotel( paging, key );
        result.put("hotelList", hotelList);
        result.put("paging", paging);
        result.put("key", key);
        return result;
    }

    public HashMap<String, Object> selectBestList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if( request.getParameter("first")!=null){
            session.removeAttribute("page");
            session.removeAttribute("key"); }
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page")); // 요청에서 page 값 가져오기
            } else if (session.getAttribute("page") != null) {
                page = (Integer) session.getAttribute("page"); // 세션에서 page 값 가져오기
            }
        } catch (NumberFormatException | ClassCastException e) { page = 1;} // 유효하지 않은 값이 있으면 기본값으로 설정
        session.setAttribute("page", page); // 세션에 현재 페이지 저장
        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key"); // 요청에서 key 값 가져오기
        } else if (session.getAttribute("key") != null) {
            key = (String) session.getAttribute("key"); } // 세션에서 key 값 가져오기
        session.setAttribute("key", key); // 세션에 검색 키워드 저장
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(5);
        paging.setDisplayRow(5);
        int count = hdao.getBestCount("hotel", "hotel_name", key);
        paging.setTotalCount(count);
        paging.calPaging();
        List<HotelVO> bestList = hdao.getBestHotel( paging, key );
        result.put("bestList", bestList);
        result.put("paging", paging);
        result.put("key", key);
        return result;
    }

    public HashMap<String, Object> selectHotList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if( request.getParameter("first")!=null){
            session.removeAttribute("page");
            session.removeAttribute("key"); }
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page")); // 요청에서 page 값 가져오기
            } else if (session.getAttribute("page") != null) {
                page = (Integer) session.getAttribute("page"); // 세션에서 page 값 가져오기
            }
        } catch (NumberFormatException | ClassCastException e) { page = 1; }// 유효하지 않은 값이 있으면 기본값으로 설정
        session.setAttribute("page", page); // 세션에 현재 페이지 저장
        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key"); // 요청에서 key 값 가져오기
        } else if (session.getAttribute("key") != null) {
            key = (String) session.getAttribute("key"); // 세션에서 key 값 가져오기
        }
        session.setAttribute("key", key); // 세션에 검색 키워드 저장
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(5);
        paging.setDisplayRow(5);
        int count = hdao.getHotCount("hotel", "hotel_name", key);
        paging.setTotalCount(count);
        paging.calPaging();
        List<HotelVO> hotList = hdao.getHotHotel( paging, key );
        result.put("hotList", hotList);
        result.put("paging", paging);
        result.put("key", key);
        return result;
    }

    public HashMap<String, Object> getHotelSearch(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        // 검색 조건 처리
        String key = request.getParameter("key") != null
                ? request.getParameter("key")
                : (String) session.getAttribute("key");
        session.setAttribute("key", key);
        // 페이지 처리
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            } else if (session.getAttribute("page") != null) {
                page = (Integer) session.getAttribute("page");
            }
        } catch (NumberFormatException | ClassCastException e) {
            page = 1;
        }
        session.setAttribute("page", page);
        // 페이징 객체 설정
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(5);
        paging.setDisplayRow(5);
        // 검색 조건에 따른 데이터 총 개수 조회
        int count = hdao.getSearchCount("hotel",  key);
        paging.setTotalCount(count);
        paging.calPaging();

        // 검색 결과 조회
        List<HotelVO> hotelList = hdao.getSearchHotel(paging, key);

        result.put("hotelList", hotelList);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public Object getHotel(int hotel_seq) {
        return hdao.getHotel(hotel_seq);
    }


//    public HashMap<String, Object> getHotelList(HttpServletRequest request) {
//        HashMap<String, Object> result = new HashMap<>();
//        HttpSession session = request.getSession();
//
//        // 페이지 처리
//        int page = 1;
//        try {
//            if (request.getParameter("page") != null) {
//                page = Integer.parseInt(request.getParameter("page"));
//            } else if (session.getAttribute("page") != null) {
//                page = (Integer) session.getAttribute("page");
//            }
//        } catch (NumberFormatException | ClassCastException e) {
//            page = 1; // 기본값으로 1 설정
//        }
//
//        // 검색 조건 처리
//        String searchType = request.getParameter("searchType") != null
//                ? request.getParameter("searchType")
//                : (String) session.getAttribute("searchType");
//        String key = request.getParameter("key") != null
//                ? request.getParameter("key")
//                : (String) session.getAttribute("key");
//
//        // 초기화 요청 처리
//        if ("true".equals(request.getParameter("first"))) {
//            page = 1; // 초기화 시 페이지를 1로 설정
//            searchType = "hotel_name"; // 기본 검색 조건
//            key = ""; // 검색 키워드 초기화
//            session.removeAttribute("page");
//            session.removeAttribute("key");
//            session.removeAttribute("searchType");
//        }
//
//        // 세션에 현재 검색 조건 및 페이지 저장
//        session.setAttribute("page", page);
//        session.setAttribute("searchType", searchType);
//        session.setAttribute("key", key);
//
//        // 페이징 처리
//        Paging paging = new Paging();
//        paging.setPage(page);
//        paging.setDisplayRow(5); // 한 페이지당 5개 출력
//        paging.setDisplayPage(10); // 페이지 네비게이션에 10개씩 표시
//        paging.setTotalCount(hdao.getAllCount("hotel", searchType, key)); // 검색 조건에 따른 총 데이터 개수
//        paging.calPaging();
//
//        // 파라미터 준비 및 데이터 조회
//        HashMap<String, Object> param = new HashMap<>();
//        param.put("paging", paging);
//        param.put("searchType", searchType);
//        param.put("key", key);
//
//        List<HotelVO> list = hdao.getHotelList(param);
//
//        // 결과 설정
//        result.put("hotelList", list);
//        result.put("paging", paging);
//        result.put("key", key);
//        result.put("searchType", searchType);
//        result.put("totalPage", (int) Math.ceil((double) paging.getTotalCount() / paging.getDisplayRow())); // 총 페이지 수 계산
//
//        return result;
//
//    }


}
