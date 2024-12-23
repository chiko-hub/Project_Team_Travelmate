package com.himedia.tp01.dao;

import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface IPlaceDao {

    int getAllCount(String place, String place_name, String key);
    List<PlaceVO> getAllPlaceList(Paging paging, String key);
    int getBestCount(String place, String placeName, String key);
    List<PlaceVO> getBestPlace(Paging paging, String key);
    int getHotCount(String place, String placeName, String key);
    List<PlaceVO> getHotPlace(Paging paging, String key);

    PlaceVO getPlace(int place_seq);
}
