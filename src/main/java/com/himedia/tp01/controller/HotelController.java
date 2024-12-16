package com.himedia.tp01.controller;

import com.himedia.tp01.dto.MemberVO;
import com.himedia.tp01.dto.WishlistVO;
import com.himedia.tp01.service.HotelService;
import com.himedia.tp01.service.WishlistService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class HotelController {

    @Autowired
    HotelService hs;
    @Autowired
    WishlistService ws;

    /* 로그인한 상태라면 wishlist 정보를 가지고 hotelSelect.jsp 로 이동 */
    @GetMapping("/hotel")
    public ModelAndView hotel(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();

        // session 에 남은 page, key 값 삭제
        session.removeAttribute("page");
        session.removeAttribute("key");

        MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
        if(currentMember == null) {
            // 로그인 후 이용할 수 있는 기능이라는 문구 뜸
        }else{
            // userid 에 해당하는 hotel 카테고리의 찜 목록 가져오기
            List<WishlistVO> wishlist = ws.getWishlistByCategory(currentMember.getUserid(), "hotel");
            // wishlist 전달
            mav.addObject("wishlist", wishlist);
        }
        mav.setViewName("hotel/hotelSelect");
        return mav;
    }

    /* 선택된 Category, page, key, first 값에 따라 불러올 장소 데이터 추출 */
    @GetMapping("/hotelSelect")
    public String getHotelListByCategory(HttpServletRequest request, Model model) {

        HashMap<String, Object> result = hs.selectHotelList(request);

        model.addAttribute("hotelList", result.get("hotelList"));
        model.addAttribute("paging", result.get("paging"));
        model.addAttribute("key", result.get("key"));
        model.addAttribute("hotelCategory", result.get("hotelCategory")); // 현재 카테고리 추가

        // JSP의 특정 HTML 조각만 반환
        return "hotel/hotelListFragment"; // JSP 파일 이름
    }

    @GetMapping("/hotelDetail")
    public ModelAndView hotelDetail(@RequestParam("hotel_seq") int hotel_seq) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("hotel", hs.getHotel(hotel_seq));
        mav.setViewName("hotel/hotelDetailModal"); // 팝업에 렌더링할 뷰
        return mav;
    }

}
