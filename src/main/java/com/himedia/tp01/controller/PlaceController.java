package com.himedia.tp01.controller;

import com.himedia.tp01.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
        mav.setViewName("place/placeSelect");
        return mav;
    }





}
