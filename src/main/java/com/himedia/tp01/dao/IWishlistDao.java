package com.himedia.tp01.dao;

import com.himedia.tp01.dto.WishlistVO;
import jakarta.validation.constraints.NotEmpty;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IWishlistDao {
    List<WishlistVO> getWishlistByUserid(String userid); // userid 로 wishlist 조회
    void addWishlist(WishlistVO wishlistvo); // wishlist 추가
    WishlistVO getWishlistByWishlistSeq(int wishlistSeq); // wishlistSeq 로 wishlist 조회
    void deleteWishlist(int wishlistSeq); // wishlist 삭제
}
