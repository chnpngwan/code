package com.hospital.service.Impl;

import com.hospital.entity.Register;
import com.hospital.mapper.LleaveMapper;
import com.hospital.service.LleaveService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class LleaveServiceImpl implements LleaveService {

    @Resource
    private LleaveMapper lleaveMapper;

    @Override
    public List<Register> selRegisters(Register register) {
        return lleaveMapper.selRegisters(register);
    }

    @Override
    public int updRstate(Register register) {
        return lleaveMapper.updRstate(register);
    }

    @Override
    public int updBstate(Register register) {
        return lleaveMapper.updBstate(register);
    }

    @Override
    public int selYaos(Register register) {
        return lleaveMapper.selYaos(register);
    }
}
