package com.sofftem.service.impl;

import com.sofftem.bean.Imga;
import com.sofftem.bean.Produce;
import com.sofftem.dao.ProduceDao;
import com.sofftem.dao.impl.ProduceDaoImpl;
import com.sofftem.service.ProduceService;
import com.sofftem.utils.Page;

import java.util.List;

public class ProduceServiceImpl implements ProduceService {
    ProduceDao produceDao = new ProduceDaoImpl();

    @Override
    public Produce queryProduceById(Integer id) {
        Produce produce = produceDao.queryProduceById(id);
        List<Imga> imgas = new ImgaServiceImpl().queryImgaByPid(produce.getImga_id());
        produce.setImga(imgas.get(0).getImage());
        return produce;
    }

    @Override
    public List<Produce> queryProduceGenreId(Integer genre_id) {
        List<Produce> produces = produceDao.queryProduceByFGenreId(genre_id);
        for (Produce produce : produces) {
            List<Imga> imgas = new ImgaServiceImpl().queryImgaByPid(produce.getImga_id());
            produce.setImga(imgas.get(0).getImage());
            produce.setIntroduction(null);
        }
        return produces;
    }

    @Override
    public Page<Produce> page(int pageNo, int pageSize, String pname, Integer genre_id) {
        Page<Produce> page = new Page<>();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        page.setPageTotalCount(produceDao.queryForPageTotalCount(pname, genre_id));//求出最大页
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
        List<Produce> produces = produceDao.queryForPageItems(begin, page.getPageSize(), pname, genre_id);
        for (Produce produce : produces) {
            List<Imga> imgas = new ImgaServiceImpl().queryImgaByPid(produce.getImga_id());
            produce.setImga(imgas.get(0).getImage());
            produce.setIntroduction(null);
        }
        page.setItems(produces);//将查询出来的结果集对象保存到page中
        return page;
    }
}
