package com.sofftem.service.impl;

import com.sofftem.bean.Live;
import com.sofftem.dao.LiveDao;
import com.sofftem.dao.impl.LiveDaoImpl;
import com.sofftem.service.LiveService;
import com.sofftem.utils.Page;

import java.util.List;

public class LivaServiceImpl implements LiveService {
    LiveDao liveDao = new LiveDaoImpl();

    @Override
    public List<Live> queryLivesByArtId(Integer art_id) {
        return liveDao.queryLiveByArtId(art_id);
    }

    @Override
    public Page<Live> page(int pageNo, int pageSize, String livename, Integer genre_id) {
        Page<Live> page = new Page<>();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        page.setPageTotalCount(liveDao.queryForPageTotalCount(livename, genre_id));//求出最大页
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
        List<Live> lives = liveDao.queryForPageItems(begin, page.getPageSize(), livename, genre_id);
        for (Live live : lives) {
            live.setAuthor(new ArtistServiceImpl().queryArtistById(live.getArt_id()).getArt_name());
            live.setGenre(new GenreServiceImpl().getGenreById(live.getGenre_id()));
        }
        page.setItems(lives);//将查询出来的结果集对象保存到page中
        return page;
    }

    public static void main(String[] args) {
        System.out.println("new LivaServiceImpl().page(1,9,\"\",0) = " + new LivaServiceImpl().page(1, 9, "余", 14));
    }
}
