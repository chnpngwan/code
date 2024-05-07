package com.sofftem.service.impl;

import com.sofftem.bean.Album;
import com.sofftem.dao.AlbumDao;
import com.sofftem.dao.impl.AlbumDaoImpl;
import com.sofftem.dao.impl.ArtistDaoImpl;
import com.sofftem.dao.impl.MusicDaoImpl;
import com.sofftem.service.AlbumService;
import com.sofftem.utils.Page;

import java.util.List;

public class AlbumServiceImpl implements AlbumService {
    AlbumDao albumDao = new AlbumDaoImpl();

    @Override
    public Album queryAlbumById(Integer id) {
        Album album = albumDao.queryAlbumById(id);
        album.setCount(new MusicDaoImpl().queryCountByAlbumId(album.getId()));
        album.setAuthorname(new ArtistDaoImpl().queryArtistById(album.getArt_id()).getArt_name());
        return album;
    }

    @Override
    public List<Album> queryAlbumsByArtId(Integer art_id) {
        List<Album> albums = albumDao.queryAlbumByArtId(art_id);
        for (Album album : albums) {
            album.setCount(new MusicDaoImpl().queryCountByAlbumId(album.getId()));
            album.setAuthorname(new ArtistDaoImpl().queryArtistById(art_id).getArt_name());
        }
        return albums;
    }

    @Override
    public Page<Album> page(int pageNo, int pageSize, String albumOrartname, Integer genre_id) {
        Page<Album> page = new Page<>();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        page.setPageTotalCount(albumDao.queryForPageTotalCount(albumOrartname, genre_id));//求出最大页
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
        List<Album> albums = albumDao.queryForPageItems(begin, page.getPageSize(), albumOrartname, genre_id);
        for (Album album : albums) {
            album.setCount(new MusicDaoImpl().queryCountByAlbumId(album.getId()));
            album.setAuthorname(new ArtistDaoImpl().queryArtistById(album.getArt_id()).getArt_name());
        }
        page.setItems(albums);//将查询出来的结果集对象保存到page中
        return page;
    }
}
