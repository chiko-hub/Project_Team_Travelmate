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

    /* wishlist 조회 */
    public List<WishlistVO> getWishlist(String userid) {
        return wdao.getWishlist(userid);
    }

    /* wishlist 추가 */
    public void addWishlist(WishlistVO wishlistvo) {
        wdao.addWishlist(wishlistvo);
    }
}
