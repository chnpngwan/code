package com.sofftem.service.impl;

import com.sofftem.dao.impl.GenreDaoImpl;
import com.sofftem.service.GenreService;

public class GenreServiceImpl implements GenreService {
    @Override
    public String getGenreById(Integer id) {
        return new GenreDaoImpl().queryGenreById(id).getGenre();
    }
}
