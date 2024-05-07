package com.sofftem.dao;

import com.sofftem.bean.Produce;

import java.util.List;

public interface ProduceDao {
    Produce queryProduceById(Integer id);

    List<Produce> queryProduceByFGenreId(Integer genre_id);

    int updateProduce(Produce produce);

    Integer queryForPageTotalCount(String pname, Integer genre_id);

    List<Produce> queryForPageItems(int begin, int pageSize, String pname, Integer genre_id);
}
