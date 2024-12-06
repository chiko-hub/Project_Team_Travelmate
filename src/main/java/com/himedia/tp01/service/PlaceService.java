package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlaceDao;
import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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

    public HashMap<String, Object> getPlaceList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
                session.setAttribute("page", page);
            } else if (session.getAttribute("page") != null) {
                page = (Integer) session.getAttribute("page");
            }
        } catch (NumberFormatException | ClassCastException e) {
            page = 1; // 파싱 실패 시 기본값으로 1 설정
        }

        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayRow(5); // 한 페이지당 5개 출력
        paging.setDisplayPage(10); // 페이지 네비게이션에 10개씩 표시

        int count = pdao.getAllCount();
        paging.setTotalCount(count);
        paging.calPaging();

        List<PlaceVO> list = pdao.getPlaceList(paging);
        result.put("placeList", list);
        result.put("paging", paging);

        return result;

    }



}
