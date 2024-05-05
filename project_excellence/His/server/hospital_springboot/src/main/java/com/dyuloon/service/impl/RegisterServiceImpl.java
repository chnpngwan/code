package com.dyuloon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dyuloon.entity.*;
import com.dyuloon.entity.customEntity.OptionEntity;
import com.dyuloon.entity.customEntity.PrescriptionDoctorPage;
import com.dyuloon.entity.customEntity.RegisterDoctorPage;
import com.dyuloon.entity.customEntity.RegisterPage;
import com.dyuloon.from.SearchForm;
import com.dyuloon.mapper.RegisterMapper;
import com.dyuloon.service.DepartmentService;
import com.dyuloon.service.DoctorService;
import com.dyuloon.service.PatientService;
import com.dyuloon.service.RegisterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dyuloon.util.PageVOUtil;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.print.Doc;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@Service
public class RegisterServiceImpl extends ServiceImpl<RegisterMapper, Register> implements RegisterService {

    @Autowired
    private DoctorService doctorService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private PatientService patientService;

    @Override
    public PageVO queryPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Register> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Register::getPatientId, searchForm.getFlag());
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.lambda().orderByDesc(Register::getRegisterDate));
        List<Register> registerList = storePage.getRecords();
        List<RegisterPage> finalList = new ArrayList<>();
        for (int i = 0; i < registerList.size(); i++) {
            RegisterPage registerPage = new RegisterPage();
            // 查医生信息
            Doctor doctor = this.doctorService.getById(registerList.get(i).getDoctorId());
            // 查科室信息
            Department department = this.departmentService.getById(doctor.getDepartmentId());
            // 塞进最终输出
            BeanUtils.copyProperties(registerList.get(i),registerPage);
            BeanUtils.copyProperties(doctor,registerPage);
            BeanUtils.copyProperties(department,registerPage);
            finalList.add(registerPage);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

    @Override
    public ResultVO findDoctor(Integer id) {
        List<OptionEntity> finalList = new ArrayList<>();
        QueryWrapper<Doctor> qw = new QueryWrapper<>();
        qw.lambda().eq(Doctor::getDepartmentId,id);
        List<Doctor> doctorList = this.doctorService.list(qw);
        for (int i = 0; i < doctorList.size(); i++) {
            OptionEntity optionEntity = new OptionEntity();
            optionEntity.setValue(doctorList.get(i).getDoctorId());
            optionEntity.setLabel(doctorList.get(i).getDoctorName());

            finalList.add(optionEntity);
        }
        ResultVO resultVO = ResultVOUtil.success(finalList, "查询成功！");
        return resultVO;
    }

    @Override
    public PageVO queryDoctorPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Register> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Register::getDoctorId, searchForm.getFlag());
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.lambda().orderByDesc(Register::getRegisterDate));
        List<Register> registerList = storePage.getRecords();
        List<RegisterDoctorPage> finalList = new ArrayList<>();
        for (int i = 0; i < registerList.size(); i++) {
            RegisterDoctorPage registerDoctorPage = new RegisterDoctorPage();
            // 查患者信息
            Patient patient = this.patientService.getById(registerList.get(i).getPatientId());
            // 塞进最终输出
            BeanUtils.copyProperties(registerList.get(i),registerDoctorPage);
            BeanUtils.copyProperties(patient,registerDoctorPage);
            finalList.add(registerDoctorPage);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

    @Override
    public ResultVO stateChange(Integer id) {
        UpdateWrapper<Register> uw = new UpdateWrapper<>();
        uw.lambda().eq(Register::getRegisterId, id);
        Register register = new Register();
        register.setCompletionStatus(1);
        Integer flag = this.baseMapper.update(register, uw);
        ResultVO resultVO = flag == 1 ? ResultVOUtil.success(null, "更新成功！") : ResultVOUtil.fail("更新失败！");
        return resultVO;
    }

    @Override
    public PageVO queryPrescriptionPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Register> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Register::getDoctorId, searchForm.getFlag());
        queryWrapper.lambda().eq(Register::getCompletionStatus, 1);
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.lambda().orderByDesc(Register::getRegisterDate));
        List<Register> registerList = storePage.getRecords();
        // 最终输出
        List<PrescriptionDoctorPage> finalList = new ArrayList<>();
        for (int i = 0; i < registerList.size(); i++) {
            PrescriptionDoctorPage prescriptionDoctorPage = new PrescriptionDoctorPage();
            // 查患者信息
            Patient patient = this.patientService.getById(registerList.get(i).getPatientId());
            // 塞进最终输出
            BeanUtils.copyProperties(registerList.get(i),prescriptionDoctorPage);
            BeanUtils.copyProperties(patient,prescriptionDoctorPage);
            finalList.add(prescriptionDoctorPage);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }
}
