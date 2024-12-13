package com.himedia.tp01.service;

import com.himedia.tp01.dao.IWishlistDao;
import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.PlaceVO;
import com.himedia.tp01.dto.WishlistDetailVO;
import com.himedia.tp01.dto.WishlistVO;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishlistService {
    @Autowired
    IWishlistDao wdao;

    /* userid 에 해당하는 wishlist 조회 */
    public List<WishlistVO> getWishlistByUserid(String userid) {
        return wdao.getWishlistByUserid(userid);
    }

    /* userid 로 해당하는 카테고리의 wishlist 조회 */
    public List<WishlistVO> getWishlistByCategory(String userid, String category) {
        return wdao.getWishlistByCategory(userid, category);
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

    /* wishlist 에 place 데이터 추가 */
    public void addPlaceWish(int wishlistSeq, PlaceVO place) {
        wdao.addPlaceWish(wishlistSeq, place);
    }

    /* wishlist 에 hotel 데이터 추가 */
    public void addHotelWish(int wishlistSeq, HotelVO hotel) {
        wdao.addHotelWish(wishlistSeq, hotel);
    }

    /* wishlist_seq 로 wishlistDetail 가져오기 */
    public List<WishlistDetailVO> getWishlistDetailByWishlistSeq(int wishlistSeq) {
        return wdao.getWishlistDetailByWishlistSeq(wishlistSeq);
    }
}
