package com.sofftem.dao;

import com.sofftem.bean.Imga;

import java.util.List;

public interface ImgaDao {
    List<Imga> queryImgaByPid(Integer pid);
}
