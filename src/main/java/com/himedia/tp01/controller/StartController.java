package com.himedia.tp01.controller;

import com.himedia.tp01.service.StartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StartController {

    @Autowired
    StartService ss;

    @GetMapping("/travel-start")
    public String travelstart(Model model) {
        //List<HotelVO> hotelList = hs.getHotel(); // 호텔 데이터 가져오기
        //model.addAttribute("hotelList", hotelList);
        return "start/travel-start";
    }

    @GetMapping("/place")
    public String place() {
        return "place/placeForm.jsp";
    }

    @GetMapping("/hotel")
    public String hotel() {
        return "place/placeForm.jsp";
    }

    @GetMapping("/like")
    public String like() {
        return "like/likeForm.jsp";
    }

}
