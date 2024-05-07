package com.sofftem.service.impl;

import com.sofftem.bean.Artist;
import com.sofftem.dao.ArtistDao;
import com.sofftem.dao.impl.ArtistDaoImpl;
import com.sofftem.service.ArtistService;
import com.sofftem.utils.Page;

import java.util.List;

public class ArtistServiceImpl implements ArtistService {
    ArtistDao artistDao = new ArtistDaoImpl();

    @Override
    public Artist queryArtistById(Integer id) {
        return artistDao.queryArtistById(id);
    }

    @Override
    public Page<Artist> page(int pageNo, int pageSize, String artist_name, Integer genre_id) {
        Page<Artist> page = new Page<>();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        page.setPageTotalCount(artistDao.queryForPageTotalCount(artist_name, genre_id));//求出最大页
        if (page.getPageTotalCount() % page.getPageSize() == 0) {
            page.setPageTotal(page.getPageTotalCount() / pageSize);//使用  [总记录数 / 当前页显示数量 = 总页数]
        } else {
            page.setPageTotal(page.getPageTotalCount() / pageSize + 1);//如果除不净的话,就需要+1  [总记录数 / 当前页显示数量 = 总页数 + 1]
        }
        if (page.getPageNo() > page.getPageTotal()) {//如果当前页大于最大页
            page.setPageNo(page.getPageTotal());//就将最大页设置给当前页
        }
        if (page.getPageNo() < 1) {
            page.setPageNo(1);
        }
        int begin = (page.getPageNo() - 1) * page.getPageSize();
        List artists = artistDao.queryForPageItems(begin, page.getPageSize(), artist_name, genre_id);
        page.setItems(artists);//将查询出来的结果集对象保存到page中
        return page;
    }
}
