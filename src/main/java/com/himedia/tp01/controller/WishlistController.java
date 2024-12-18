package com.himedia.tp01.controller;

import com.himedia.tp01.dto.*;
import com.himedia.tp01.service.WishlistService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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

    /* wishlist 정보 가져오기 */
    @GetMapping("/getWishlist")
    @ResponseBody
    public List<WishlistVO> getWishlist(HttpSession session) {
        List<WishlistVO> wishlist = null;
        MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
        if(currentMember != null) {
            wishlist = ws.getWishlistByUserid(currentMember.getUserid()); // wishlist 가져오기
        }
        return wishlist;
    }

    /* wishlistDetail 정보 가져오기 */
    @GetMapping("/getWishDetail")
    @ResponseBody
    public List<WishlistDetailVO> getWishDetail(@RequestParam("wishlist_seq") int wishlistSeq) {
        // wishlist_seq에 해당하는 상세 정보 반환
        return ws.getWishlistDetailByWishlistSeq(wishlistSeq);
    }

    /* 찜 목록 생성 */
    @PostMapping("/addWishlist")
    @ResponseBody
    public Map<String, String> addWishlist(
            HttpSession session,
            @RequestParam("wishlist_title") String wishlist_title,
            @RequestParam("wishlist_category") String wishlist_category) {
        Map<String, String> response = new HashMap<>(); // 응답 데이터를 담을 Map
        MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");

        if (currentMember == null) { // 로그인이 되어 있지 않다면
            response.put("status", "not_login");
            return response;
        }

        // 로그인 되어 있으면 찜 목록 생성
        ws.addWishlist(wishlist_category, wishlist_title, currentMember.getUserid()); // 찜 목록 추가
        response.put("status", "success");

        return response; // 응답 반환
    }

    /* 찜 목록 삭제 */
    @PostMapping("/deleteWishlist")
    @ResponseBody
    public Map<String, Object> deleteWishlist(
            @RequestBody Map<String, Integer> requestBody, HttpSession session) {
        int wishlistSeq = requestBody.get("wishlistSeq");
        Map<String, Object> response = new HashMap<>(); // 응답 데이터를 담을 Map
        MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");

        if (currentMember == null) { // 로그인이 되어 있지 않다면
            response.put("status", "not_login");
            return response;
        }

        // wishlistSeq 로 wishlist 가져오기
        WishlistVO wishlist = ws.getWishlistByWishlistSeq(wishlistSeq);

        if (wishlist != null) { // wishlistSeq 에 해당하는 wishlist 가 있다면
            ws.deleteWishlist(wishlistSeq); // wishlist 삭제
            response.put("status", "success");
            response.put("message", "해당 찜 목록을 성공적으로 삭제했습니다.");
        } else { // 세부 계획 정보가 없다면
            response.put("success", "fail");
            response.put("message", "해당 찜 목록의 정보를 불러오지 못했습니다.");
        }
        return response; // JSON 형태로 반환
    }

    /* 찜 목록에 추가 */
    @PostMapping("/addWish")
    @ResponseBody
    public Map<String, Object> addWish(@RequestBody Map<String, Object> requestBody){
        int wishlistSeq = Integer.parseInt((String)requestBody.get("wishlistSeq"));
        int wishSeq = Integer.parseInt((String)requestBody.get("wishSeq"));
        String wishCategory = (String) requestBody.get("wishCategory");
        Map<String, Object> response = new HashMap<>();

        // wishlistSeq 로 wishlist 가져오기
        WishlistVO wishlist = ws.getWishlistByWishlistSeq(wishlistSeq);

        Boolean isCheckInsertWish;
        if (wishlist != null) { // wishlist 가 존재한다면
            isCheckInsertWish = ws.addWish(wishlistSeq, wishCategory, wishSeq); // wishlistSeq 에 해당하는 wishlist 에 place 저장
            if(isCheckInsertWish) {
                response.put("success", true);
                response.put("message", "해당 찜 목록에 저장했습니다.");
            }else {
                response.put("success", false);
                response.put("message", "해당 찜 목록에 추가하려는 데이터가 이미 존재합니다.");
            }
        }else {
            // 세부 계획 정보가 없다면
            response.put("success", false);
            response.put("message", "해당 찜 목록을 불러오지 못했습니다.");
        }
        return response; // JSON 형태로 반환
    }

    /* 찜 목록에서 wishlistDetail 삭제 */
    @PostMapping("/deleteWishDetail")
    @ResponseBody
    public Map<String, Object> wishlistDetailSeq(@RequestBody Map<String, Integer> requestBody) {
        int wishlistDetailSeq = requestBody.get("wishlistDetailSeq");
        Map<String, Object> response = new HashMap<>(); // 응답 데이터를 담을 Map

        // wishlistSeq 로 wishlist 가져오기
        WishlistDetailVO wishlistDetail = ws.getWishlistDetail(wishlistDetailSeq);

        if (wishlistDetail != null) { // wishlistDetailSeq 에 해당하는 wishlistDetail 이 있다면
            ws.deleteWishDetail(wishlistDetailSeq); // wishlistDetail 삭제
            response.put("success", true);
            response.put("message", "해당 목록을 찜에서 성공적으로 삭제했습니다.");
        } else { // 세부 계획 정보가 없다면
            response.put("success", false);
            response.put("message", "해당 목록의 정보를 불러오지 못했습니다.");
        }
        return response; // JSON 형태로 반환
    }
}
