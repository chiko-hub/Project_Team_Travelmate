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
        return "start/travel-start";
    }
}
