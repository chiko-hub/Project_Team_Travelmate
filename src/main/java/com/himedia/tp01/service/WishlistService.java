package com.himedia.tp01.service;

import com.himedia.tp01.dao.IWishlistDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishlistService {
    @Autowired
    IWishlistDao wdao;

}
