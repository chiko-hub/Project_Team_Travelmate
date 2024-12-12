package com.himedia.tp01.controller;

import com.himedia.tp01.dto.MemberVO;
import com.himedia.tp01.dto.WishlistVO;
import com.himedia.tp01.service.WishlistService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class WishlistController {
    @Autowired
    WishlistService ws;

    /* 현재 로그인한 유저의 wishlist 를 가지고 wishlistForm.jsp 로 이동 */
    @GetMapping("/wishlist")
    public ModelAndView wishlist(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
        if(currentMember == null) {
            mav.setViewName("redirect:/loginForm");
        }else{
            List<WishlistVO> wishlist = ws.getWishlist(currentMember.getUserid()); // wishlist 가져오기
            System.out.println(wishlist); // 테스트코드
            mav.addObject("wishlist", wishlist);
            mav.setViewName("wishlist/wishlistForm");
        }
        return mav;
    }

    /* 찜 목록 생성 */
    @PostMapping("/addWishlist")
    public String addWishlist(HttpSession session, WishlistVO wishlistvo) {
        MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
        if(currentMember == null) {
            return "redirect:/loginForm";
        }else {
            wishlistvo.setUserid(currentMember.getUserid());
            ws.addWishlist(wishlistvo); // wishlist 추가
            return "redirect:/wishlist";
        }
    }

}
