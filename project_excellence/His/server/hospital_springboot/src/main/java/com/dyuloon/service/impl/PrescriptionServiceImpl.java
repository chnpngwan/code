package com.dyuloon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dyuloon.entity.*;
import com.dyuloon.entity.customEntity.*;
import com.dyuloon.from.PrescriptionForm;
import com.dyuloon.from.SearchForm;
import com.dyuloon.mapper.PrescriptionMapper;
import com.dyuloon.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dyuloon.util.PageVOUtil;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
public class PrescriptionServiceImpl extends ServiceImpl<PrescriptionMapper, Prescription> implements PrescriptionService {

    @Autowired
    private PrescriptionDrugService prescriptionDrugService;
    @Autowired
    private RegisterService registerService;
    @Autowired
    private DrugsService drugsService;
    @Autowired
    private PatientService patientService;
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private DepartmentService departmentService;

    @Override
    public ResultVO savePrescription(PrescriptionForm prescriptionForm) {
        //先存处方表
        Prescription prescription = new Prescription();
        BeanUtils.copyProperties(prescriptionForm, prescription);
        this.baseMapper.insert(prescription);
        // 存储处方药
        for (int i = 0; i < prescriptionForm.getChildren().size(); i++) {
            this.prescriptionDrugService.save(prescriptionForm.getChildren().get(i));
            // 修改药品数量
            UpdateWrapper<Drugs> uw = new UpdateWrapper<>();
            uw.lambda().eq(Drugs::getDrugsId, prescriptionForm.getChildren().get(i).getDrugsId());
            // 查药品原有数量
            Drugs drugs = this.drugsService.getById(prescriptionForm.getChildren().get(i).getDrugsId());
            drugs.setInventoryNum(drugs.getInventoryNum()-prescriptionForm.getChildren().get(i).getMedicineNum());
            this.drugsService.update(drugs, uw);
        }
        // 更改处方状态
        UpdateWrapper<Register> uw = new UpdateWrapper<>();
        uw.lambda().eq(Register::getRegisterId, prescriptionForm.getRegisterId());
        Register register = new Register();
        register.setPrescriptionStatus(1);
        this.registerService.update(register, uw);
        ResultVO resultVO = ResultVOUtil.success(null, "添加成功！");
        return resultVO;
    }

    @Override
    public PageVO queryPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Prescription> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Prescription::getDoctorId,searchForm.getFlag());
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("prescription_id"));
        List<Prescription> prescriptionList = storePage.getRecords();
        List<CaseDoctorPage> finalList = new ArrayList<>();
        for (int i = 0; i < prescriptionList.size(); i++) {
            CaseDoctorPage caseDoctorPage = new CaseDoctorPage();
            Patient patient = this.patientService.getById(prescriptionList.get(i).getPatientId());
            BeanUtils.copyProperties(patient,caseDoctorPage);
            BeanUtils.copyProperties(prescriptionList.get(i),caseDoctorPage);

            finalList.add(caseDoctorPage);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

    @Override
    public ResultVO deleteCaseById(Integer id) {
        // 删除处方单
        QueryWrapper<Prescription> qw = new QueryWrapper<>();
        qw.lambda().eq(Prescription::getRegisterId,id);
        this.baseMapper.delete(qw);
        // 删除药物
        QueryWrapper<PrescriptionDrug> qwDrug = new QueryWrapper<>();
        qwDrug.lambda().eq(PrescriptionDrug::getRegisterId, id);
        this.prescriptionDrugService.remove(qwDrug);
        // 更改处方状态
        UpdateWrapper<Register> uw = new UpdateWrapper<>();
        uw.lambda().eq(Register::getRegisterId, id);
        Register register = new Register();
        register.setPrescriptionStatus(0);
        this.registerService.update(register, uw);

        ResultVO resultVO = ResultVOUtil.success(null, "删除成功！");
        return resultVO;
    }

    @Override
    public ResultVO getDrugById(Integer id) {
        PrescriptionDrugMsg finalObj = new PrescriptionDrugMsg();
        // 查处方单
        QueryWrapper<Prescription> prescriptionQueryWrapper = new QueryWrapper<>();
        prescriptionQueryWrapper.lambda().eq(Prescription::getRegisterId, id);
        Prescription prescription = this.baseMapper.selectOne(prescriptionQueryWrapper);
        // 处方单信息塞进最终输出
        BeanUtils.copyProperties(prescription, finalObj);

        // 查患者信息
        Patient patient = this.patientService.getById(prescription.getPatientId());
        // 患者信息塞进最终输出
        BeanUtils.copyProperties(patient, finalObj);

        // 查药物信息
        List<PrescriptionDrugObj> drugList = new ArrayList<>();
        QueryWrapper<PrescriptionDrug> qw = new QueryWrapper<>();
        qw.lambda().eq(PrescriptionDrug::getRegisterId, id);
        List<PrescriptionDrug> prescriptionDrugList = this.prescriptionDrugService.list(qw);
        for (int i = 0; i < prescriptionDrugList.size(); i++) {
            PrescriptionDrugObj prescriptionDrugObj = new PrescriptionDrugObj();
            Drugs drugs = this.drugsService.getById(prescriptionDrugList.get(i).getDrugsId());
            BeanUtils.copyProperties(prescriptionDrugList.get(i), prescriptionDrugObj);
            BeanUtils.copyProperties(drugs, prescriptionDrugObj);

            drugList.add(prescriptionDrugObj);
        }
        // 药物信息塞进最终输出
        finalObj.setChildren(drugList);

        ResultVO resultVO = ResultVOUtil.success(finalObj, "查询成功！");
        return resultVO;
    }

    @Override
    public PageVO queryPatientCasePage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Prescription> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Prescription::getPatientId,searchForm.getFlag());
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("prescription_id"));
        List<Prescription> prescriptionList = storePage.getRecords();
        List<CasePatientPage> finalList = new ArrayList<>();
        for (int i = 0; i < prescriptionList.size(); i++) {
            CasePatientPage casePatientPage = new CasePatientPage();
            Doctor doctor = this.doctorService.getById(prescriptionList.get(i).getDoctorId());
            // 查医生科室
            Department department = this.departmentService.getById(doctor.getDepartmentId());
            BeanUtils.copyProperties(doctor,casePatientPage);
            BeanUtils.copyProperties(department,casePatientPage);
            BeanUtils.copyProperties(prescriptionList.get(i),casePatientPage);

            finalList.add(casePatientPage);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

    @Override
    public PageVO queryPatientPayPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Prescription> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Prescription::getPatientId,searchForm.getFlag());
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("prescription_id"));
        List<Prescription> prescriptionList = storePage.getRecords();
        List<CasePatientPayPage> finalList = new ArrayList<>();
        for (int i = 0; i < prescriptionList.size(); i++) {
            CasePatientPayPage casePatientPayPage = new CasePatientPayPage();
            Doctor doctor = this.doctorService.getById(prescriptionList.get(i).getDoctorId());
            // 查医生科室
            Department department = this.departmentService.getById(doctor.getDepartmentId());
            // 查药物信息
            double drugsSum = 0;
            QueryWrapper<PrescriptionDrug> qw = new QueryWrapper<>();
            qw.lambda().eq(PrescriptionDrug::getRegisterId, prescriptionList.get(i).getRegisterId());
            List<PrescriptionDrug> prescriptionDrugList = this.prescriptionDrugService.list(qw);
            for (int j = 0; j < prescriptionDrugList.size(); j++) {
                Drugs drugs = this.drugsService.getById(prescriptionDrugList.get(j).getDrugsId());
                drugsSum += drugs.getDeliveryPrice();
            }
            BeanUtils.copyProperties(doctor,casePatientPayPage);
            BeanUtils.copyProperties(department,casePatientPayPage);
            BeanUtils.copyProperties(prescriptionList.get(i),casePatientPayPage);
            casePatientPayPage.setDrugsPrice(drugsSum);

            finalList.add(casePatientPayPage);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }

    @Override
    public PageVO queryAdminUnpayPage(SearchForm searchForm) {
        Page storePage = new Page(searchForm.getPageNum(), searchForm.getPageSize());
        QueryWrapper<Prescription> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().ne(Prescription::getPaymentStatus,1);
        queryWrapper.like(Strings.isNotEmpty(searchForm.getValue()), searchForm.getKey(), searchForm.getValue());
        this.baseMapper.selectPage(storePage, queryWrapper.orderByDesc("prescription_id"));
        List<Prescription> prescriptionList = storePage.getRecords();
        List<AdminUnpayPage> finalList = new ArrayList<>();
        for (int i = 0; i < prescriptionList.size(); i++) {
            AdminUnpayPage adminUnpayPage = new AdminUnpayPage();
            Doctor doctor = this.doctorService.getById(prescriptionList.get(i).getDoctorId());
            // 查医生科室
            Department department = this.departmentService.getById(doctor.getDepartmentId());
            // 查患者
            Patient patient = this.patientService.getById(prescriptionList.get(i).getPatientId());
            BeanUtils.copyProperties(doctor,adminUnpayPage);
            BeanUtils.copyProperties(department,adminUnpayPage);
            BeanUtils.copyProperties(patient,adminUnpayPage);
            BeanUtils.copyProperties(prescriptionList.get(i),adminUnpayPage);

            finalList.add(adminUnpayPage);
        }
        storePage.setRecords(finalList);
        PageVO pageVO = PageVOUtil.success(storePage.getRecords(), "查询成功！", storePage.getTotal(), storePage.getCurrent(), storePage.getSize());
        return pageVO;
    }
}
