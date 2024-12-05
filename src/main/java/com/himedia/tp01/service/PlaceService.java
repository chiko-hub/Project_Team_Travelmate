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

    public HashMap<String, Object> selectBestList() {
        HashMap<String, Object> result = new HashMap<>();
        List<PlaceVO> bestList = pdao.selectBestList();
        result.put("bestList", bestList);
        return result;
    }
}
