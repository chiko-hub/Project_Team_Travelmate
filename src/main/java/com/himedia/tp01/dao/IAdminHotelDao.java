package com.himedia.tp01.dao;

import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.QueryParameter;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminHotelDao {
    int getAllCount(QueryParameter parameter);
    List<HotelVO> getHotelList(Paging paging, String key);

    void insertHotel(HotelVO hotelvo);
}
