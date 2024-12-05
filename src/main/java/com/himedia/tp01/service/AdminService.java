package com.himedia.tp01.service;

import com.himedia.tp01.dao.IAdminDao;
import com.himedia.tp01.dto.AdminVO;
import com.himedia.tp01.dto.HotelVO;
import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminService {

    @Autowired
    IAdminDao adao;

    public AdminVO getAdmin(String adminid) {return adao.getAdmin(adminid);}

    public HashMap<String, Object> adminPlaceList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if( request.getParameter("first") != null ) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }
        int page = 1;
        if( request.getParameter("page") != null ) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }else if( session.getAttribute("page") != null ) {
            page = Integer.parseInt((String)session.getAttribute("page"));
        }

        String key="";
        if( request.getParameter("key") != null ) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        }else if( session.getAttribute("key") != null ) {
            key = (String)session.getAttribute("key");
        }

        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);
        int count = adao.getAllCount( "place", "name", key );
        System.out.println( count );
        paging.setTotalCount(count);
        paging.calPaging();

        List<PlaceVO> list = adao.getPlaceList( paging , key);
        result.put("placeList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;

    }
}
