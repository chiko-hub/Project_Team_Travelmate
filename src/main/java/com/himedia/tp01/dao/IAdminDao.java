package com.himedia.tp01.dao;

import com.himedia.tp01.dto.AdminVO;
import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminDao {


    AdminVO getAdmin(String adminid);
    int getAllCount(String place, String place_name, String key);
    List<PlaceVO> getPlaceList(Paging paging, String key);
}
