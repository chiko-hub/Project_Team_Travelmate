package com.himedia.tp01.controller;

import com.himedia.tp01.dto.MemberVO;
import com.himedia.tp01.service.WishlistService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WishlistController {
    @Autowired
    WishlistService ws;

    /* wishlistForm.jsp 로 이동 */
    @GetMapping("/wishlist")
    public String wishlist(HttpSession session) {
        /*MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
        if(currentMember == null) {
            return "redirect:/loginForm";
        }else{*/
            return "wishlist/wishlistForm";
        /*}*/
    }

}
