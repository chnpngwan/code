package com.dyuloon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dyuloon.entity.Drugs;
import com.dyuloon.entity.Patient;
import com.dyuloon.entity.Prescription;
import com.dyuloon.entity.PrescriptionDrug;
import com.dyuloon.entity.customEntity.PrescriptionDrugMsg;
import com.dyuloon.entity.customEntity.PrescriptionDrugObj;
import com.dyuloon.mapper.PrescriptionDrugMapper;
import com.dyuloon.service.DrugsService;
import com.dyuloon.service.PatientService;
import com.dyuloon.service.PrescriptionDrugService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dyuloon.service.PrescriptionService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.ResultVO;
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
 * @since 2023-07-26
 */
@Service
public class PrescriptionDrugServiceImpl extends ServiceImpl<PrescriptionDrugMapper, PrescriptionDrug> implements PrescriptionDrugService {


}
