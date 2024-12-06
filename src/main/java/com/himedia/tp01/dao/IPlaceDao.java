package com.himedia.tp01.dao;

import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IPlaceDao {

    List<PlaceVO> selectBestList();
    List<PlaceVO> selectHotList();
    PlaceVO getPlace(int placeSeq);
    int getAllCount();
    List<PlaceVO> getPlaceList(Paging paging);
}
