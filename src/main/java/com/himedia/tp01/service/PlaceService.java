package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlaceDao;
import com.himedia.tp01.dto.PlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class PlaceService {

    @Autowired
    IPlaceDao pdao;

    public HashMap<String, Object> selectBestHotList() {
        HashMap<String, Object> result = new HashMap<>();
        List<PlaceVO> bestList = pdao.selectBestList();
        List<PlaceVO> hotList = pdao.selectHotList();
        result.put("bestList", bestList);
        result.put("hotList", hotList);
        return result;
    }

    public Object getPlace(int place_seq) {
        return pdao.getPlace(place_seq);
    }


//    public HashMap<String, Object> selectBestList() {
//        HashMap<String, Object> result = new HashMap<>();
//        try {
//            List<PlaceVO> bestList = pdao.selectBestList();
//            result.put("bestList", bestList);
//        } catch (Exception e) {
//            e.printStackTrace();
//            result.put("bestList", null);
//        }
//        return result;
//    }
}
