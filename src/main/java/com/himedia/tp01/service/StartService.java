package com.himedia.tp01.service;

import com.himedia.tp01.dao.IStartDao;
import com.himedia.tp01.dto.StartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StartService {

    @Autowired
    IStartDao sdao;

}
