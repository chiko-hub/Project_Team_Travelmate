package com.himedia.tp01.controller;

import com.himedia.tp01.service.HotelService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class HotelController {

    @Autowired
    HotelService hs;

    @GetMapping("/hotelSelect")
    public ModelAndView hotelSelect() {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = hs.selectBestHotList();
        mav.addObject("bestList", result.get("bestList"));
        mav.addObject("hotList", result.get("hotList"));
        System.out.println("bestList :" + result.get("bestList"));
        System.out.println("hotList :" + result.get("hotList"));
        mav.setViewName("hotel/hotelSelect");
        return mav;
    }

    @GetMapping("/hotelDetail")
    public ModelAndView hotelDetail(@RequestParam("hotel_seq") int hotel_seq) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("hotel", hs.getHotel(hotel_seq) );
        mav.setViewName("hotel/hotelDetail");
        return mav;
    }

    @GetMapping("/hotelList")
    public ModelAndView getHotelList(HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView();

        // "first" 파라미터가 있으면 세션 초기화
        if (request.getParameter("first") != null) {
            request.getSession().removeAttribute("page");
            request.getSession().removeAttribute("key");
            request.getSession().removeAttribute("searchType");
        }

        HashMap<String, Object> result = hs.getHotelList(request);
        mav.addObject("hotelList", result.get("hotelList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("totalPage", result.get("totalPage")); //  totalPage 전달
        mav.addObject("key", result.get("key")); // 검색어
        mav.addObject("searchType", result.get("searchType")); // 검색 타입 전달
        mav.setViewName("hotel/hotelList");
        return mav;
    }


}
