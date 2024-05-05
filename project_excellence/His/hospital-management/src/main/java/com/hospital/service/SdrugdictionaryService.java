package com.hospital.service;

import com.hospital.entity.Area;
import com.hospital.entity.Sdrugdictionary;
import com.hospital.entity.Type;
import com.hospital.entity.Unit;
import com.hospital.mapper.SdrugdictionaryMapper;

import java.util.List;

public interface SdrugdictionaryService {
    List<SdrugdictionaryMapper> findAllSdrugdictionary(Sdrugdictionary sdrugdictionary);
    int addSdrugdictionary(Sdrugdictionary sdrugdictionary);
    int editSdrugdictionary(Sdrugdictionary sdrugdictionary);
    int deleteSdrugdictionary(Integer drugId);
    List<Unit> findAllUnit();
    List<Area> findAllArea();
    List<Type> findAllType();
    int count(Sdrugdictionary sdrugdictionary);
}
