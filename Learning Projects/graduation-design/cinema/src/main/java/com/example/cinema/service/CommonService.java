package com.example.cinema.service;

import com.example.cinema.vo.HomePageVO;

public interface CommonService {
    String getToken();
    HomePageVO getHomePageVO();
    void getRegisterCode(String to);
    void getForgetCode(String to);
    void incrViewCount();
}
