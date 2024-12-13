package com.himedia.tp01.dao;

import com.himedia.tp01.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminDao {


    AdminVO getAdmin(String adminid);

    int getAllCount(QueryParameter parameter);

    List<PlaceVO> getPlaceList(Paging paging, String key);
    void insertPlace(PlaceVO placevo);
    void updatePlace(PlaceVO placevo);
    void deletePlace(int place_seq);

    List<HotelVO> getHotelList(Paging paging, String key);
    void insertHotel(HotelVO hotelvo);
    void updateHotel(HotelVO hotelvo);
    void deleteHotel(int hotel_seq);

    List<MemberVO> getMemberList(Paging paging, String key);

}
