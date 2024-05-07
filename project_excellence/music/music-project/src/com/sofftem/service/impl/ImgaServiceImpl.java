package com.sofftem.service.impl;

import com.sofftem.bean.Imga;
import com.sofftem.dao.ImgaDao;
import com.sofftem.dao.impl.ImgaDaoImpl;
import com.sofftem.service.ImgaService;

import java.util.List;

public class ImgaServiceImpl implements ImgaService {
    ImgaDao imgaDao = new ImgaDaoImpl();

    @Override
    public String FirstImgaById(Integer pid) {
        List<Imga> imgas = imgaDao.queryImgaByPid(pid);
        return imgas.get(0).getImage();
    }

    @Override
    public List<Imga> queryImgaByPid(Integer pid) {
        return imgaDao.queryImgaByPid(pid);
    }
}
