package com.sofftem.dao.impl;

import com.sofftem.bean.Imga;
import com.sofftem.dao.ImgaDao;
import com.sofftem.utils.BaseDao;

import java.util.List;

public class ImgaDaoImpl extends BaseDao<Imga> implements ImgaDao {
    @Override
    public List<Imga> queryImgaByPid(Integer pid) {
        return this.getBeanList("select * from imga where produce_id= ?", pid);
    }
}
