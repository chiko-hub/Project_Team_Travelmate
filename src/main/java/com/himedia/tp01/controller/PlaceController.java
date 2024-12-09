package com.himedia.tp01.controller;

import com.himedia.tp01.service.PlaceService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class PlaceController {

    @Autowired
    PlaceService ps;

    @GetMapping("/placeSelect")
    public ModelAndView placeSelect() {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ps.selectBestHotList();
        mav.addObject("bestList", result.get("bestList"));
        mav.addObject("hotList", result.get("hotList"));
        System.out.println("bestList: " + result.get("bestList"));
        System.out.println("hotList: " + result.get("hotList"));
        mav.setViewName("place/placeSelect");
        return mav;
    }

    @GetMapping("/placeDetail")
    public ModelAndView place(@RequestParam("place_seq") int place_seq) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("place", ps.getPlace(place_seq) );
        mav.setViewName("place/placeDetail");
        return mav;
    }

    @GetMapping("/placeList")
    public ModelAndView getPlaceList(HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();

        // 요청 값 우선 처리: searchType과 key를 요청에서 가져오거나, 세션에서 가져옴
        String searchType = request.getParameter("searchType") != null
                ? request.getParameter("searchType")
                : (String) session.getAttribute("searchType");

        String key = request.getParameter("key") != null
                ? request.getParameter("key")
                : (String) session.getAttribute("key");

        // "first" 파라미터가 있으면 검색 조건 및 페이지 초기화
        if ("true".equals(request.getParameter("first"))) {
            searchType = "place_name"; // 기본 검색 조건
            key = ""; // 검색 키워드 초기화
            session.removeAttribute("page"); // 페이지 초기화
            session.removeAttribute("key");
            session.removeAttribute("searchType");
        }

        // 세션에 검색 조건 저장 (다음 요청에서도 유지되도록)
        session.setAttribute("searchType", searchType);
        session.setAttribute("key", key);

        // 서비스 호출: 검색 조건과 페이징 처리
        HashMap<String, Object> result = ps.getPlaceList(request);
        mav.addObject("placeList", result.get("placeList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("totalPage", result.get("totalPage")); //  totalPage 전달
        mav.addObject("key", result.get("key")); // 검색어
        mav.addObject("searchType", result.get("searchType")); // 검색 타입 전달
        mav.setViewName("place/placeList");
        return mav;
    }





}
