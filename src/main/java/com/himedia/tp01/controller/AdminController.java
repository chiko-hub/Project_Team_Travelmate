package com.himedia.tp01.controller;

import com.himedia.tp01.dto.AdminVO;
import com.himedia.tp01.service.AdminService;
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
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class AdminController {

    @Autowired
    AdminService as;

    @GetMapping("/admin")
    public String admin(Model model) {
        return "admin/adminLogin";
    }

    @PostMapping("/adminLogin")
    public String adminLogin(@ModelAttribute("dto") @Valid AdminVO adminvo,
                             BindingResult result, HttpSession session, Model model) {
        String url = "admin/adminLogin";
        if (result.getFieldError("adminid") != null)
            model.addAttribute("message", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "패스워드를 입력하세요");
        else {
            AdminVO avo = as.getAdmin(adminvo.getAdminid());
            if (avo == null || !adminvo.getPwd().equals(avo.getPwd())) {
                model.addAttribute("message", "아이디와 패스워드를 확인하세요");
            } else {
                session.setAttribute("adminUser", avo);  // 세션에 사용자 정보 저장
                url = "redirect:/adminPlaceList";       // 리다이렉트
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
}

