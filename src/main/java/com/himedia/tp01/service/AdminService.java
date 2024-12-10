package com.himedia.tp01.service;

import com.himedia.tp01.dao.IAdminDao;
import com.himedia.tp01.dto.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminService {

    @Autowired
    private IAdminDao adao;

    public AdminVO getAdmin(String adminid) {
        return adao.getAdmin(adminid);
    }

    public HashMap<String, Object> adminPlaceList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        if (request.getParameter("first") != null) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }

        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        } else if (session.getAttribute("page") != null) {
            page = Integer.parseInt((String) session.getAttribute("page"));
        }

        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        } else if (session.getAttribute("key") != null) {
            key = (String) session.getAttribute("key");
        }

        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);

        // QueryParameter 생성
        QueryParameter parameter = new QueryParameter("place", "place_name", key);

        // getAllCount 호출
        int count = adao.getAllCount(parameter);
        System.out.println(count);
        paging.setTotalCount(count);
        paging.calPaging();

        List<PlaceVO> list = adao.getPlaceList(paging, key);
        result.put("placeList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public HashMap<String, Object> adminHotelList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        if (request.getParameter("first") != null) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }

        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }

        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        }

        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);

        // QueryParameter 생성
        QueryParameter parameter = new QueryParameter("hotel", "hotel_name", key);

        // getAllCount 호출
        int count = adao.getAllCount(parameter);
        System.out.println(count);
        paging.setTotalCount(count);
        paging.calPaging();

        List<HotelVO> list = adao.getHotelList(paging, key);
        result.put("hotelList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public void insertPlace(PlaceVO placevo) {
        adao.insertPlace( placevo );
    }
    public void updatePlace(PlaceVO placevo) {
        adao.updatePlace( placevo );
    }

    public void insertHotel(HotelVO hotelvo) {
        adao.insertHotel( hotelvo );
    }
    public void updateHotel(HotelVO hotelvo) {
        adao.updateHotel( hotelvo );
    }

    public HashMap<String, Object> adminMemberList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        if (request.getParameter("first") != null) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }

        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }

        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        }

        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);

        // QueryParameter 생성
        QueryParameter parameter = new QueryParameter("member", "name", key);

        // getAllCount 호출
        int count = adao.getAllCount(parameter);
        System.out.println(count);
        paging.setTotalCount(count);
        paging.calPaging();

        List<MemberVO> list = adao.getMemberList(paging, key);
        result.put("memberList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }
}

