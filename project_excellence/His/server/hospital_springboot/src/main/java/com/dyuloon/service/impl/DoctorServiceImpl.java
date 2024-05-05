package com.dyuloon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dyuloon.entity.Department;
import com.dyuloon.entity.Doctor;
import com.dyuloon.entity.customEntity.ChangeDoctorDepartmentEntity;
import com.dyuloon.entity.customEntity.DoctorEntity;
import com.dyuloon.entity.customEntity.UpdateDoctorDepartmentEntity;
import com.dyuloon.from.SearchForm;
import com.dyuloon.mapper.DoctorMapper;
import com.dyuloon.service.DepartmentService;
import com.dyuloon.service.DoctorService;
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
 * 服务实现类
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@Service
public class DoctorServiceImpl extends ServiceImpl<DoctorMapper, Doctor> implements DoctorService {

    @Autowired
    private DepartmentService departmentService;

    @Override
    public PageVO queryPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Doctor> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("doctor_id"));
        List<DoctorEntity> finalList = new ArrayList<>();
        List<Doctor> doctorList = storePage.getRecords();
        for (int i = 0; i < doctorList.size(); i++) {
            Department department = this.departmentService.getById(doctorList.get(i).getDepartmentId());
            DoctorEntity doctorEntity = new DoctorEntity();
            BeanUtils.copyProperties(doctorList.get(i), doctorEntity);
            doctorEntity.setDepartmentName(department.getDepartmentName());
            finalList.add(doctorEntity);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

    @Override
    public PageVO queryOneDepartment(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Doctor> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("doctor_id"));
        List<ChangeDoctorDepartmentEntity> finalList = new ArrayList<>();
        List<Doctor> doctorList = storePage.getRecords();
        for (int i = 0; i < doctorList.size(); i++) {
            Department department = this.departmentService.getById(doctorList.get(i).getDepartmentId());
            ChangeDoctorDepartmentEntity changeDoctorDepartmentEntity = new ChangeDoctorDepartmentEntity();
            BeanUtils.copyProperties(doctorList.get(i), changeDoctorDepartmentEntity);
            changeDoctorDepartmentEntity.setDepartmentName(department.getDepartmentName());
            finalList.add(changeDoctorDepartmentEntity);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

    @Override
    public ResultVO updateDoctorDepartment(UpdateDoctorDepartmentEntity updateDoctorDepartmentEntity) {
        UpdateWrapper<Doctor> uw = new UpdateWrapper<>();
        uw.lambda().eq(Doctor::getDoctorId, updateDoctorDepartmentEntity.getDoctorId());
        Doctor doctor = new Doctor();
        doctor.setDepartmentId(updateDoctorDepartmentEntity.getDepartmentId());
        Integer flag = this.baseMapper.update(doctor, uw);
        ResultVO resultVO = flag == 1 ? ResultVOUtil.success(null, "更新成功！") : ResultVOUtil.fail("更新失败！");
        return resultVO;
    }
}
