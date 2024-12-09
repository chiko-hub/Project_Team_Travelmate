package com.himedia.tp01.controller;

import com.himedia.tp01.dto.AdminVO;
import com.himedia.tp01.service.AdminService;
import com.himedia.tp01.service.PlaceService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class AdminController {

@Autowired
AdminService as;

@GetMapping("/admin")
    public String admin(Model model) { return "admin/adminLogin"; }

@PostMapping("/adminLogin")
    public String adminLogin(
        @ModelAttribute("dto") @Valid AdminVO adminvo, BindingResult result,
        HttpSession session, Model model){
    String url = "admin/adminLogin";

    if(result.getFieldError("adminid") != null)
        model.addAttribute("message", "아이디를 입력하세요");
    else if(result.getFieldError("pwd") != null)
        model.addAttribute("message", "비밀번호를 입력하세요");
    else{
        AdminVO avo = as.getAdmin(adminvo.getAdminid());
        if ( (avo == null) || (!adminvo.getPwd().equals(avo.getPwd())) )
            model.addAttribute("message", "아이디와 비밀번호를 확인하세요");
        else{
            session.setAttribute("adminUser", avo);
            url = "redirect:/adminPlaceList";
        }
    }
    return url;

}

    @GetMapping("/adminPlaceList")
    public ModelAndView adminPlaceList(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = as.adminPlaceList(request);

        mav.addObject("placeList", result.get("placeList") );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );

        mav.setViewName("admin/place/placeList");
        return mav;
    }

    @Autowired
    PlaceService ps;

    @GetMapping("/adminPlaceDetail")
    public ModelAndView adminProductDetail( @RequestParam("place_seq") int place_seq ) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("placeVO", ps.getPlace(place_seq));

        mav.setViewName("admin/product/productDetail");
        return mav;
    }

    @GetMapping("/adminHotelList")
    public ModelAndView adminHotelList(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    HashMap<String, Object> result = as.adminHotelList(request);

    mav.addObject("hotelList", result.get("hotelList") );
    mav.addObject( "paging", result.get("paging") );
    mav.addObject( "key", result.get("key") );

    mav.setViewName("admin/hotel/hotelList");
    return mav;
    }
}
