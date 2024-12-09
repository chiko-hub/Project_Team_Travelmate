package com.himedia.tp01.dao;

import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface IPlaceDao {

    List<PlaceVO> selectBestList();
    List<PlaceVO> selectHotList();
    PlaceVO getPlace(int place_seq);
    int getAllCount(String place, String place_name, String key);
//    List<PlaceVO> getPlaceList(Paging paging, String searchType, String key);
    List<PlaceVO> getPlaceList(HashMap<String, Object> param);


}
