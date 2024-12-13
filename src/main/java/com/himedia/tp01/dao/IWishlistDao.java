package com.himedia.tp01.dao;

import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.PlaceVO;
import com.himedia.tp01.dto.WishlistVO;
import jakarta.validation.constraints.NotEmpty;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IWishlistDao {
    List<WishlistVO> getWishlistByUserid(String userid); // userid 에 해당하는 wishlist 조회
    List<WishlistVO> getWishlistByCategory(String userid, String category); // category 에 해당하는 wishlist 조회
    void addWishlist(WishlistVO wishlistvo); // wishlist 추가
    WishlistVO getWishlistByWishlistSeq(int wishlistSeq); // wishlistSeq 로 wishlist 조회
    void deleteWishlist(int wishlistSeq); // wishlist 삭제

    void addPlaceWish(int wishlistSeq, PlaceVO place); // wishlistSeq 에 place데이터 추가
    void addHotelWish(int wishlistSeq, HotelVO hotel); // wishlistSeq 에 place데이터 추가
}
