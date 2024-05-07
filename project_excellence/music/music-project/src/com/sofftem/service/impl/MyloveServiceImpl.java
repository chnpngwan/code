package com.sofftem.service.impl;

import com.sofftem.bean.Mylove;
import com.sofftem.dao.MyloveDao;
import com.sofftem.dao.impl.MyloveDaoImpl;
import com.sofftem.service.MyloveService;
import com.sofftem.utils.Page;

import java.util.List;

public class MyloveServiceImpl implements MyloveService {
    MyloveDao myloveDao = new MyloveDaoImpl();

    @Override
    public String addMylove(int musice_id, int uid) {
        if (myloveDao.queryMyloveBymusic_idAndUid(musice_id, uid) == null) {
            if (myloveDao.saveMylove(musice_id, uid) == 1) {
                return "1添加成功";
            } else return "2添加失败";
        }
        return "7此歌曲已在我喜欢";
    }

    @Override
    public List<Mylove> queryMylove(int uid) {
        return myloveDao.findMyloveByUid(uid);
    }

    @Override
    public int deleteMylove(int id) {
        return myloveDao.deleteMyloveByid(id);
    }

    @Override
    public Page<Mylove> page(int pageNo, int pageSize, int uid) {
        Page<Mylove> page = new Page<>();
        page.setPageNo(pageNo);//将参数pageNo保存到page对象
        page.setPageSize(pageSize);//将参数pageSize保存到page对象
        //获取t_book表的总记数 , 并将总记数封装到page对象中
        page.setPageTotalCount(myloveDao.queryForPageTotalCount(uid));
        //求出最大页
        if (page.getPageTotalCount() % page.getPageSize() == 0) {
            //使用  [总记录数 / 当前页显示数量 = 总页数]
            page.setPageTotal(page.getPageTotalCount() / pageSize);
        } else {
            //如果除不净的话,就需要+1  [总记录数 / 当前页显示数量 = 总页数 + 1]
            page.setPageTotal(page.getPageTotalCount() / pageSize + 1);
        }
        //如果当前页大于最大页
        if (page.getPageNo() > page.getPageTotal()) {
            page.setPageNo(page.getPageTotal());//就将最大页设置给当前页
        }
        //如果当前页小于最小页
        if (page.getPageNo() < 1) {
            page.setPageNo(1);//就将第一页设置给当前页
        }

        //通过当前网与每页显示数 求出 起始页
        int begin = (page.getPageNo() - 1) * page.getPageSize();
        List<Mylove> myloves = myloveDao.queryForPageItems(begin, page.getPageSize(), uid);
        for (Mylove mylove : myloves) {
            mylove.setMusic(new MusicServiceImpl().queryMusicByid(mylove.getMusic_id()));
        }
        page.setItems(myloves);//将查询出来的结果集对象保存到page中
        return page;
    }
}
