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
    IAdminDao adao;

    public AdminVO getAdmin(String adminid) {
        return adao.getAdmin(adminid);
    }

    public HashMap<String, Object> adminPlaceList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        // 초기화 요청 처리
        if (request.getParameter("first") != null) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }

        // 페이지 처리
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page")); // 요청 파라미터로부터 페이지 값 설정
                session.setAttribute("page", page); // 세션에 저장
            } else if (session.getAttribute("page") != null) {
                Object sessionPage = session.getAttribute("page"); // 세션에서 값 가져오기
                if (sessionPage instanceof Integer) {
                    page = (Integer) sessionPage; // Integer 타입일 경우 그대로 사용
                } else if (sessionPage instanceof String) {
                    page = Integer.parseInt((String) sessionPage); // String 타입일 경우 변환
                }
            }
        } catch (NumberFormatException e) {
            page = 1; // 잘못된 값이 들어온 경우 기본값 설정
        }

        // 검색 키워드 처리
        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        } else if (session.getAttribute("key") != null) {
            Object sessionKey = session.getAttribute("key");
            if (sessionKey instanceof String) {
                key = (String) sessionKey;
            }
        }

        // 페이징 처리
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

        // 데이터 리스트 조회
        List<PlaceVO> list = adao.getPlaceList(paging, key);
        result.put("placeList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }


    public HashMap<String, Object> adminHotelList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();

        // 초기화 요청 처리
        if (request.getParameter("first") != null) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }

        // 페이지 처리
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page")); // 요청 파라미터로부터 페이지 값 설정
                session.setAttribute("page", page); // 세션에 저장
            } else if (session.getAttribute("page") != null) {
                Object sessionPage = session.getAttribute("page"); // 세션에서 값 가져오기
                if (sessionPage instanceof Integer) {
                    page = (Integer) sessionPage; // Integer 타입일 경우 그대로 사용
                } else if (sessionPage instanceof String) {
                    page = Integer.parseInt((String) sessionPage); // String 타입일 경우 변환
                }
            }
        } catch (NumberFormatException e) {
            page = 1; // 잘못된 값이 들어온 경우 기본값 설정
        }

        // 검색 키워드 처리
        String key = "";
        if (request.getParameter("key") != null) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        } else if (session.getAttribute("key") != null) {
            Object sessionKey = session.getAttribute("key");
            if (sessionKey instanceof String) {
                key = (String) sessionKey;
            }
        }

        // 페이징 처리
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

        // 데이터 리스트 조회
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

