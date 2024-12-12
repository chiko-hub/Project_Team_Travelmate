package com.himedia.tp01.service;

import com.himedia.tp01.dao.IWishlistDao;
import com.himedia.tp01.dto.WishlistVO;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishlistService {
    @Autowired
    IWishlistDao wdao;

    /* userid 로 wishlist 조회 */
    public List<WishlistVO> getWishlistByUserid(String userid) {
        return wdao.getWishlistByUserid(userid);
    }

    /* wishlistSeq 로 wishlist 조회 */
    public WishlistVO getWishlistByWishlistSeq(int wishlistSeq) {
        return wdao.getWishlistByWishlistSeq(wishlistSeq);
    }

    /* wishlist 추가 */
    public void addWishlist(WishlistVO wishlistvo) {
        wdao.addWishlist(wishlistvo);
    }

    /* wishlist 삭제 */
    public void deleteWishlist(int wishlistSeq) {
        wdao.deleteWishlist(wishlistSeq);
    }
}
