package com.himedia.tp01.controller;

import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.PlaceVO;
import com.himedia.tp01.service.AdminHotelService;
import com.himedia.tp01.service.HotelService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;

@Controller
public class AdminHotelController {

    @Autowired
    AdminHotelService ahs;


    @GetMapping("/adminHotelListNew")
    public ModelAndView adminHotelList(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ahs.adminHotelList(request);
        mav.addObject("hotelList", result.get("hotelList") );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );
        mav.setViewName("admin/hotel/hotelList");
        return mav;
    }

    @GetMapping("/adminHotelWriteFormNew")
    public String adminHotelWriteForm(Model model) {
        return "admin/hotel/hotelWrite";
    }


    @PostMapping("/adminHotelWrite")
    public String adminHotelWrite(@ModelAttribute("dto") @Valid HotelVO hotelvo, BindingResult result, Model model, HttpSession session) {
        String url = "admin/hotel/hotelWrite";

        if( result.getFieldError("hotel_name") != null )
            model.addAttribute("message", "호텔명을 입력하세요");
        else if( result.getFieldError("hotel_location") != null )
            model.addAttribute("message", "호텔의 주소를 입력하세요");
        else if( (result.getFieldError("hotel_description") != null) )
            model.addAttribute("message", "호텔의 설명내용을 입력하세요");
        else if( (result.getFieldError("hotel_image") != null) || (result.getFieldError("hotel_savefilename") != null)  )
            model.addAttribute("message", "파일을 선택하세요");
        else{
            ahs.insertHotel(hotelvo);
            url = "redirect:/adminHotelList";
        }
        return url;
    }

    @Autowired
    ServletContext context;

    @PostMapping("/fileupload")
    @ResponseBody
    public HashMap<String, Object> fileupload( @RequestParam("fileimage") MultipartFile file){
        String path = context.getRealPath("/hotel_images");
        Calendar today = Calendar.getInstance();
        long t = today.getTimeInMillis();
        String filename = file.getOriginalFilename();
        String fn1 = filename.substring(0, filename.indexOf(".") );  // 파일이름과 확장자 분리
        String fn2 = filename.substring(filename.indexOf(".") );
        String savefilename = fn1 + t + fn2;
        String uploadPath = path + "/" + savefilename;

        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
            file.transferTo( new File(uploadPath) );  // 파일의 업로드 + 저장
            result.put("image", filename );
            result.put("savefilename", savefilename );
        } catch (IllegalStateException e) {         e.printStackTrace();
        } catch (IOException e) {       e.printStackTrace();
        }

        return result;
    }

    @Autowired
    HotelService hs;
    @GetMapping("/adminHotelUpdateForm")
    public ModelAndView adminHotelUpdateForm( @RequestParam("hotel_seq") int hotel_seq ) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("hotelVO", hs.getHotel(hotel_seq));
        // HotelService 의 getHotel 메서드 사용
        mav.setViewName("admin/hotel/hotelUpdate");
        return mav;
    }



    @PostMapping("/adminHotelUpdate")
    public String adminHotelUpdate(@ModelAttribute("dto") @Valid HotelVO hotelvo, BindingResult result, Model model, HttpSession session) {
        String url = "admin/hotel/hotelUpdate";

        if( result.getFieldError("hotel_name") != null )
            model.addAttribute("message", "호텔 이름을 입력하세요");
        else if( result.getFieldError("hotel_location") != null )
            model.addAttribute("message", "호텔의 주소를 입력하세요");
        else if( (result.getFieldError("hotel_description") != null) )
            model.addAttribute("message", "호텔의 설명내용을 작성하세요");
        else if( (result.getFieldError("hotel_image") != null) || (result.getFieldError("hotel_savefilename") != null)  )
            model.addAttribute("message", "파일을 선택하세요");
        else{
            ahs.updateHotel(hotelvo);
            url = "redirect:/adminHotelDetail?hotel_seq=" + hotelvo.getHotel_seq();
        }
        return url;
    }












}
