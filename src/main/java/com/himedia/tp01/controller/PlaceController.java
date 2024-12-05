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

    @GetMapping("/placesearch")
    public String loginForm() {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ps.selectBestList();
        mav.addObject("bestList", result.get("bestList"));
        mav.setViewName("placesearch");
        return "place/placeSearch";
    }




}
