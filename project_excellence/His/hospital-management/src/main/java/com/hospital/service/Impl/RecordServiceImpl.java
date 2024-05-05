package com.hospital.service.Impl;

import com.hospital.entity.Record;
import com.hospital.mapper.RecordMapper;
import com.hospital.service.RecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RecordServiceImpl implements RecordService {
    @Resource
    private RecordMapper rd;
    @Override
    public List<Record> selrecord(Record record) {
        return rd.selrecord(record);
    }

    @Override
    public int addjilu(Record record) {
        return rd.addjilu(record);
    }
}
