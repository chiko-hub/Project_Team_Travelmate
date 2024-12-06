package com.himedia.tp01.controller;

import com.himedia.tp01.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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


}
