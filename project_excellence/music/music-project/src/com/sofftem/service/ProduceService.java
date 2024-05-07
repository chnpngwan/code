package com.sofftem.service;

import com.sofftem.bean.Produce;
import com.sofftem.utils.Page;

import java.util.List;

public interface ProduceService {
    Produce queryProduceById(Integer id);

    List<Produce> queryProduceGenreId(Integer genre_id);

    Page<Produce> page(int pageNo, int pageSize, String pname, Integer genre_id);
}
