package wng.example.service.impl;

import wng.example.base.BaseDao;
import wng.example.base.BaseServiceImpl;
import wng.example.mapper.ScMapper;
import wng.example.po.Sc;
import wng.example.service.ScService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScServiceImpl extends BaseServiceImpl<Sc> implements ScService {

    @Autowired
    private ScMapper scMapper;

    @Override
    public BaseDao<Sc> getBaseDao() {
        return scMapper;
    }
}
