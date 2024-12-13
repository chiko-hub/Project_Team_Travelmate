package com.himedia.tp01.dao;

import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.PlaceVO;
import com.himedia.tp01.dto.WishlistDetailVO;
import com.himedia.tp01.dto.WishlistVO;
import jakarta.validation.constraints.NotEmpty;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IWishlistDao {
    List<WishlistVO> getWishlistByUserid(String userid); // userid 에 해당하는 wishlist 조회
    List<WishlistVO> getWishlistByCategory(String userid, String category); // category 에 해당하는 wishlist 조회
    void addWishlist(WishlistVO wishlistvo); // wishlist 추가
    WishlistVO getWishlistByWishlistSeq(int wishlistSeq); // wishlist_seq 로 wishlist 조회
    void deleteWishlist(int wishlistSeq); // wishlist 삭제

    void addPlaceWish(int wishlistSeq, PlaceVO place); // wishlist_seq 에 place데이터 추가
    void addHotelWish(int wishlistSeq, HotelVO hotel); // wishlist_seq 에 place데이터 추가

    List<WishlistDetailVO> getWishlistDetailByWishlistSeq(int wishlistSeq); // wishlist_seq 로 wishlistDetail 조회
    WishlistDetailVO getWishlistDetail(int wishlistDetailSeq); // wishlist_detail_seq 로 wishlistDetail 조회
    void deleteWishlistDetail(int wishlistDetailSeq); // wishlistDetail 삭제
}
