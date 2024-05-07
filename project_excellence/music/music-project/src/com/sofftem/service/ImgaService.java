package com.sofftem.service;

import com.sofftem.bean.Imga;

import java.util.List;

public interface ImgaService {
    String FirstImgaById(Integer pid);

    List<Imga> queryImgaByPid(Integer pid);
}
