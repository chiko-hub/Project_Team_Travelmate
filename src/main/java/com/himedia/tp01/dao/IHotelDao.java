package com.himedia.tp01.dao;

import com.himedia.tp01.dto.HotelVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IHotelDao {


    List<HotelVO> selectBestList();
    List<HotelVO> selectHotList();
}
