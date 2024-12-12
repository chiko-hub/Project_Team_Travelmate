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
    public ModelAndView placeSelect(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ps.selectAllList( request );
        HttpSession session = request.getSession();
        // 항상 세션의 페이지를 1로 초기화
        session.setAttribute("page", 1);

        mav.addObject("placeList", result.get("placeList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key"));
        mav.addObject("viewType", "placeList"); // 뷰 타입 추가
        mav.setViewName("place/placeSelect");
        return mav;
    }

    @GetMapping("/selectBest")
    public ModelAndView selectBest(HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ps.selectBestList(request);

        HttpSession session = request.getSession();
        // 항상 세션의 페이지를 1로 초기화
        session.setAttribute("page", 1);

        mav.addObject("bestList", result.get("bestList"));
        System.out.println("bestList: " + result.get("bestList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key"));
        mav.addObject("viewType", "bestList"); // 뷰 타입 추가
        mav.setViewName("place/placeSelectBest");
        return mav;
    }

    @GetMapping("/selectHot")
    public ModelAndView selectHot(HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ps.selectHotList(request);
        HttpSession session = request.getSession();
        // 항상 세션의 페이지를 1로 초기화
        session.setAttribute("page", 1);
        mav.addObject("hotList", result.get("hotList"));
        System.out.println("hotList: " + result.get("hotList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key"));
        mav.addObject("viewType", "hotList"); // 뷰 타입 추가
        mav.setViewName("place/placeSelectHot");
        return mav;
    }


    @GetMapping("/placeSearch")
    public ModelAndView getPlaceSearch(HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();

        // 검색조건 설정: 요청 값 우선 처리: key를 요청에서 가져오거나, 세션에서 가져옴
        String key = request.getParameter("key") != null
                ? request.getParameter("key")
                : (String) session.getAttribute("key");

        // "first" 파라미터가 있으면 검색 조건 및 페이지 초기화
        if ("true".equals(request.getParameter("first"))) {
            key = ""; // 검색 키워드 초기화
            session.removeAttribute("page"); // 페이지 초기화
            session.removeAttribute("key");
        }

        // 세션에 검색 조건 저장 (다음 요청에서도 유지되도록)
        session.setAttribute("key", key);

        // 서비스 호출: 검색 조건과 페이징 처리
        HashMap<String, Object> result = ps.getPlaceSearch(request);
        mav.addObject("placeList", result.get("placeList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key")); // 검색어
        mav.setViewName("place/placeSelect");
        return mav;
    }

    @GetMapping("/placeDetail")
    public ModelAndView placeDetail(@RequestParam("place_seq") int place_seq, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("place", ps.getPlace(place_seq));
        mav.setViewName("place/placeDetailModal"); // 팝업에 렌더링할 뷰
        return mav;
    }


}
