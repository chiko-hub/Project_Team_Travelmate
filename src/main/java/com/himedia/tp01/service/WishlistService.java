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
    @Autowired
    PlaceService ps;
    @Autowired
    HotelService hs;

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
    public void addWishlist(String wishlist_category, String wishlist_title, String userid) {
        WishlistVO wishlistvo = new WishlistVO();
        wishlistvo.setWishlist_category(wishlist_category); // 카테고리
        wishlistvo.setWishlist_title(wishlist_title); // 제목
        wishlistvo.setUserid(userid); // 로그인된 사용자 id

        wdao.addWishlist(wishlistvo);
    }

    /* wishlist 삭제 */
    public void deleteWishlist(int wishlistSeq) {
        wdao.deleteWishlist(wishlistSeq);
    }

    /* wishlist_seq 에 wishlist_detail_seq 저장하기 */
    public Boolean addWish(int wishlistSeq, String wishCategory, int wishSeq) {
        boolean result;
        if(wishCategory.equals("place")){
            PlaceVO place = ps.getPlace(wishSeq);
            if(!getCheckInsertWish(wishlistSeq, place.getPlace_name())){
                System.out.println("place: " + getCheckInsertWish(wishlistSeq, place.getPlace_name()));
                wdao.addPlaceWish(wishlistSeq, place);
                result = true;
            }else{
                result = false;
            }
        }else{ // wishCategory.equals('hotel')
            HotelVO hotel = hs.getHotel(wishSeq);
            if(!getCheckInsertWish(wishlistSeq, hotel.getHotel_name())){
                System.out.println("hotel: " + getCheckInsertWish(wishlistSeq, hotel.getHotel_name()));
                wdao.addHotelWish(wishlistSeq, hotel);
                result = true;
            }else{
                result = false;
            }
        }
        return result;
    }

    /* wishlist_seq 에 wishlist_detail_seq 가 있는지 검사하기 */
    public Boolean getCheckInsertWish(int wishlistSeq, String wishName) {
        return wdao.getCheckInsertWish(wishlistSeq, wishName);
    }

    /* wishlist_seq 로 wishlistDetail 가져오기 */
    public List<WishlistDetailVO> getWishlistDetailByWishlistSeq(int wishlistSeq) {
        return wdao.getWishlistDetailByWishlistSeq(wishlistSeq);
    }

    /* wishlist_detail_seq 로 wishlistDetail 가져오기 */
    public WishlistDetailVO getWishlistDetail(int wishlistDetailSeq) {
        return wdao.getWishlistDetail(wishlistDetailSeq);
    }

    /* wishlistDetail 삭제 */
    public void deleteWishDetail(int wishlistDetailSeq) {
        wdao.deleteWishlistDetail(wishlistDetailSeq);
    }
}
