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

    public HashMap<String, Object> selectBestHotList() {
        HashMap<String, Object> result = new HashMap<>();
        List<PlaceVO> bestList = pdao.selectBestList();
        List<PlaceVO> hotList = pdao.selectHotList();
        result.put("bestList", bestList);
        result.put("hotList", hotList);
        return result;
    }

    public Object getPlace(int place_seq) {
        return pdao.getPlace(place_seq);
    }

    public HashMap<String, Object> getPlaceList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        // 초기화 요청 처리
        if (request.getParameter("first") != null) {
            session.removeAttribute("page");
            session.removeAttribute("key");
            session.removeAttribute("searchType");
        }

        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
                session.setAttribute("page", page);
            } else if (session.getAttribute("page") != null) {
                page = (Integer) session.getAttribute("page");
            }
        } catch (NumberFormatException | ClassCastException e) {
            page = 1; //기본값으로 1 설정
        }

        String searchType = request.getParameter("searchType") != null ? request.getParameter("searchType") : "place_name";
        String key = request.getParameter("key") != null ? request.getParameter("key") : "";


        // 초기화 시 기본 검색 조건 설정
        if (request.getParameter("first") != null) {
            searchType = "place_name";
            key = "";
        } else {
            // 검색어와 검색 타입 세션 유지
            if (request.getParameter("key") != null) {
                key = request.getParameter("key");
                session.setAttribute("key", key);
            } else if (session.getAttribute("key") != null) {
                key = (String) session.getAttribute("key");
            }

            if (request.getParameter("searchType") != null) {
                searchType = request.getParameter("searchType");
                session.setAttribute("searchType", searchType);
            } else if (session.getAttribute("searchType") != null) {
                searchType = (String) session.getAttribute("searchType");
            }
        }

        // Paging 객체 생성 및 설정
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayRow(5); // 한 페이지당 5개 출력
        paging.setDisplayPage(10); // 페이지 네비게이션에 10개씩 표시

        paging.setTotalCount(pdao.getAllCount("place", searchType, key)); // 검색 타입 반영, 총 데이터 개수 설정
        paging.calPaging();

        // HashMap으로 파라미터 전달, 데이터 조회
        HashMap<String, Object> param = new HashMap<>();
        param.put("paging", paging);
        param.put("searchType", searchType);
        param.put("key", key);

        List<PlaceVO> list = pdao.getPlaceList(param);
        result.put("placeList", list);
        result.put("paging", paging);
        result.put("key", key);
        result.put("searchType", searchType);
        result.put("totalPage", (int) Math.ceil((double) paging.getTotalCount() / paging.getDisplayRow())); // 총 페이지 수 계산

        return result;

    }



}
