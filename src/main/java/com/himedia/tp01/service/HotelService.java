package com.himedia.tp01.service;

import com.himedia.tp01.dao.IHotelDao;
import com.himedia.tp01.dto.HotelVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class HotelService {

    @Autowired
    IHotelDao hdao;

    public HashMap<String, Object> selectBestHotList() {
        HashMap<String, Object> result = new HashMap<>();
        List<HotelVO> bestList = hdao.selectBestList();
        List<HotelVO> hotList = hdao.selectHotList();
        result.put("bestList", bestList);
        result.put("hotList", hotList);
        return result;
    }
}
