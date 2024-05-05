package com.hospital.mapper;

import com.hospital.entity.Area;
import com.hospital.entity.Sdrugdictionary;
import com.hospital.entity.Type;
import com.hospital.entity.Unit;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface SdrugdictionaryMapper {
    //药品字典的增删改查
    List<SdrugdictionaryMapper> findAllSdrugdictionary(Sdrugdictionary sdrugdictionary);
    int addSdrugdictionary(Sdrugdictionary sdrugdictionary);
    int editSdrugdictionary(Sdrugdictionary sdrugdictionary);
    int deleteSdrugdictionary(Integer drugId);
    List<Unit> findAllUnit();
    List<Area> findAllArea();
    List<Type> findAllType();
    int count(Sdrugdictionary sdrugdictionary);
}
