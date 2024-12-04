package com.himedia.tp01.dao;

import com.himedia.tp01.dto.StartVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IStartDao {
    List<StartVO> getHotel();
}
