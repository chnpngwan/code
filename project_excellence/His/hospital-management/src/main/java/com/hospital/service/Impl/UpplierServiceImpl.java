package com.hospital.service.Impl;

import com.hospital.entity.Upplier;
import com.hospital.mapper.UpplierMapper;
import com.hospital.service.UpplierService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class UpplierServiceImpl implements UpplierService {
    @Resource
    private UpplierMapper UpplierMapper;
    @Override
    public List<Upplier> findAllUpplier(Upplier upplier) {
        return UpplierMapper.findAllUpplier(upplier);
    }

    @Override
    public int deleteUpplier(Integer supplierId) {
        return UpplierMapper.deleteUpplier(supplierId);
    }

    @Override
    public int addUpplier(Upplier upplier) {
        return UpplierMapper.addUpplier(upplier);
    }


    @Override
    public int count(Upplier upplier) {
        return UpplierMapper.count(upplier);
    }
}
