package com.himedia.tp01.dao;

import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface IHotelDao {


    List<HotelVO> selectBestList();
    List<HotelVO> selectHotList();
    HotelVO getHotel(int hotel_seq);
    int getAllCount(String hotel, String hotel_name, String key);
    List<HotelVO> getHotelList(HashMap<String, Object> param);
}
