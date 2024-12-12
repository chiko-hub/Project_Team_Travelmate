package com.himedia.tp01.controller;

import com.himedia.tp01.dto.AdminVO;
import com.himedia.tp01.dto.PlaceVO;
import com.himedia.tp01.service.AdminService;
import com.himedia.tp01.service.HotelService;
import com.himedia.tp01.service.PlaceService;
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

    @GetMapping("/adminLogout")
    public String adminLogout(HttpSession session) {
        session.removeAttribute("adminUser");
        return "redirect:/";
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
    public ModelAndView adminPlaceDetail( @RequestParam("place_seq") int place_seq ) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("placeVO", ps.getPlace(place_seq));
        mav.setViewName("admin/place/placeDetail");
        return mav;
    }

    @GetMapping("/adminPlaceWriteForm")
    public String adminPlaceWriteForm(Model model) {

    return "admin/place/placeWrite";

   }

    @PostMapping("/adminPlaceWrite")
    public String adminPlaceWrite(@ModelAttribute("dto") @Valid PlaceVO placevo, BindingResult result, Model model, HttpSession session) {
        String url = "admin/place/placeWrite";

        if( result.getFieldError("place_name") != null )
            model.addAttribute("message", "장소 이름을 입력하세요");
        else if( result.getFieldError("place_location") != null )
            model.addAttribute("message", "위치를 입력하세요");
        else if( (result.getFieldError("place_description") != null) )
            model.addAttribute("message", "상세 설명을 입력하세요");
        else if( (result.getFieldError("place_image") != null) || (result.getFieldError("savefilename") != null)  )
            model.addAttribute("message", "파일을 선택하세요");

        else{
            as.insertPlace(placevo);
            url = "redirect:/adminPlaceList";
        }
        return url;
    }

    @Autowired
    ServletContext context;

    @PostMapping("/fileup")
    @ResponseBody
    public HashMap<String, Object> fileup(    @RequestParam("fileimage")MultipartFile file        ){
        String path = context.getRealPath("/place_images");

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

    @GetMapping("/adminPlaceUpdateForm")
    public ModelAndView adminPlaceUpdateForm( @RequestParam("place_seq") int place_seq ) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("placeVO", ps.getPlace(place_seq));

        mav.setViewName("admin/place/placeUpdate");
        return mav;
    }

    @PostMapping("/adminPlaceUpdate")
    public String adminPlaceUpdate( @ModelAttribute("dto") @Valid PlaceVO placevo, BindingResult result, Model model, HttpSession session) {
        String url = "admin/place/placeUpdate";

        if( result.getFieldError("place_name") != null )
            model.addAttribute("message", "장소 이름을 입력하세요");
        else if( result.getFieldError("place_location") != null )
            model.addAttribute("message", "장소 주소를 입력하세요");
        else if( (result.getFieldError("place_description") != null) )
            model.addAttribute("message", "장소 설명을 입력하세요");
        else if( (result.getFieldError("place_image") != null) || (result.getFieldError("savefilename") != null)  )
            model.addAttribute("message", "파일을 선택하세요");

        else{
            as.updatePlace(placevo);
            url = "redirect:/adminPlaceDetail?place_seq=" + placevo.getPlace_seq();
        }
        return url;
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

    @Autowired
    HotelService hs;

    @GetMapping("/adminHotelDetail")
    public ModelAndView adminHotelDetail( @RequestParam("hotel_seq") int hotel_seq ) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("hotelVO", hs.getHotel(hotel_seq));
        mav.setViewName("admin/hotel/hotelDetail");
        return mav;
    }

    @GetMapping("/adminHotelWriteForm")
    public String adminHotelWriteForm(Model model) {
        return "admin/hotel/hotelWrite";
    }


    @GetMapping("/adminMemberList")
    public ModelAndView adminMemberList( HttpServletRequest request ) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = as.adminMemberList( request );
        mav.addObject("memberList", result.get("memberList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key"));
        mav.setViewName( "admin/member/memberList" );
        return mav;
    }




}
