package com.sofftem.dao.impl;

import com.sofftem.bean.Genre;
import com.sofftem.dao.GenreDao;
import com.sofftem.utils.BaseDao;

import java.util.List;

public class GenreDaoImpl extends BaseDao<Genre> implements GenreDao {
    @Override
    public Genre queryGenreById(Integer id) {
        return  this.getBean("select * from genre where id = ? ", id);
    }
}
