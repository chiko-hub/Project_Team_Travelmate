package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlaceDao;
import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class PlaceService {

    @Autowired
    IPlaceDao pdao;

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
        int count = pdao.getAllCount("place", "place_name", key);
        paging.setTotalCount(count);
        paging.calPaging();
        List<PlaceVO> placeList = pdao.getAllPlaceList( paging, key );
        result.put("placeList", placeList);
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
        int count = pdao.getBestCount("place", "place_name", key);
        paging.setTotalCount(count);
        paging.calPaging();
        List<PlaceVO> bestList = pdao.getBestPlace( paging, key );
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
        int count = pdao.getHotCount("place", "place_name", key);
        paging.setTotalCount(count);
        paging.calPaging();
        List<PlaceVO> hotList = pdao.getHotPlace( paging, key );
        result.put("hotList", hotList);
        result.put("paging", paging);
        result.put("key", key);
        return result;
    }


    public Object getPlace(int place_seq) {
        return pdao.getPlace(place_seq);
    }


    public HashMap<String, Object> getPlaceSearch(HttpServletRequest request) {
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
        int count = pdao.getSearchCount("place",  key);
        System.out.println("Total Count: " + count); // 디버깅: 총 데이터 개수 확인
        paging.setTotalCount(count);
        paging.calPaging();

        // 검색 결과 조회
        List<PlaceVO> placeList = pdao.getSearchPlaceList(paging, key);

        result.put("placeList", placeList);
        result.put("paging", paging);
        result.put("key", key);

        return result;

    }
}
