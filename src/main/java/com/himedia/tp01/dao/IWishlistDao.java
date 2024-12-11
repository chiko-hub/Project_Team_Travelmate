package com.himedia.tp01.dao;

import com.himedia.tp01.dto.WishlistVO;
import jakarta.validation.constraints.NotEmpty;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IWishlistDao {
    List<WishlistVO> getWishlist(String userid); // wishlist 조회
    void addWishlist(WishlistVO wishlistvo); // wishlist 추가
}
