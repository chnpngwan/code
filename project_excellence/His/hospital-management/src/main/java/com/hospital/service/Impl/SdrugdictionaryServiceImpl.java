package com.hospital.service.Impl;

import com.hospital.entity.Area;
import com.hospital.entity.Sdrugdictionary;
import com.hospital.entity.Type;
import com.hospital.entity.Unit;
import com.hospital.mapper.SdrugdictionaryMapper;
import com.hospital.service.SdrugdictionaryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class SdrugdictionaryServiceImpl implements SdrugdictionaryService {
    @Resource
    private SdrugdictionaryMapper sdrugdictionaryMapper;
    @Override
    public List<SdrugdictionaryMapper> findAllSdrugdictionary(Sdrugdictionary sdrugdictionary) {
        return sdrugdictionaryMapper.findAllSdrugdictionary(sdrugdictionary);
    }

    @Override
    public int addSdrugdictionary(Sdrugdictionary sdrugdictionary) {
        return sdrugdictionaryMapper.addSdrugdictionary(sdrugdictionary);
    }

    @Override
    public int editSdrugdictionary(Sdrugdictionary sdrugdictionary) {
        return sdrugdictionaryMapper.editSdrugdictionary(sdrugdictionary);
    }

    @Override
    public int deleteSdrugdictionary(Integer drugId) {
        return sdrugdictionaryMapper.deleteSdrugdictionary(drugId);
    }

    @Override
    public List<Unit> findAllUnit() {
        return sdrugdictionaryMapper.findAllUnit();
    }

    @Override
    public List<Area> findAllArea() {
        return sdrugdictionaryMapper.findAllArea();
    }

    @Override
    public List<Type> findAllType() {
        return sdrugdictionaryMapper.findAllType();
    }

    @Override
    public int count(Sdrugdictionary sdrugdictionary) {
        return sdrugdictionaryMapper.count(sdrugdictionary);
    }
}
