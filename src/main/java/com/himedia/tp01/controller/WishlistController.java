package com.himedia.tp01.controller;

import com.himedia.tp01.dto.MemberVO;
import com.himedia.tp01.dto.PlanDetailVO;
import com.himedia.tp01.dto.WishlistVO;
import com.himedia.tp01.service.WishlistService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            List<WishlistVO> wishlist = ws.getWishlistByUserid(currentMember.getUserid()); // wishlist 가져오기
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

    /* 찜 목록 삭제 */
    @PostMapping("/deleteWishlist")
    @ResponseBody
    public Map<String, Object> deleteWishlist(@RequestBody Map<String, Integer> requestBody) {
        int wishlistSeq = requestBody.get("wishlistSeq");
        Map<String, Object> response = new HashMap<>(); // 응답 데이터를 담을 Map

        // wishlistSeq 로 wishlist 가져오기
        WishlistVO wishlist = ws.getWishlistByWishlistSeq(wishlistSeq);

        if (wishlist != null) { // wishlistSeq 에 해당하는 wishlist 가 있다면
            ws.deleteWishlist(wishlistSeq); // wishlist 삭제
            response.put("success", true);
            response.put("message", "해당 찜 목록을 성공적으로 삭제했습니다.");
        } else { // 세부 계획 정보가 없다면
            response.put("success", false);
            response.put("message", "해당 찜 목록의 정보를 불러오지 못했습니다.");
        }
        return response; // JSON 형태로 반환
    }

}
