package com.himedia.tp01.dao;

import com.himedia.tp01.dto.PlanVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IPlanDao {

    PlanVO getPlan(String code); // code 에 해당하는 plan 불러오기

}
