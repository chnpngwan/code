package com.sofftem.service;

import com.sofftem.bean.Mylove;
import com.sofftem.utils.Page;

import java.util.List;

public interface MyloveService {
    String addMylove(int musice_id, int uid);

    List<Mylove> queryMylove(int uid);

    int deleteMylove(int id);
    Page<Mylove> page(int pageNo, int pageSize, int uid);

}
