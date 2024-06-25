package com.medical.service;

import com.medical.dao.*;
import com.medical.entity.IllnessKind;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author XUEW
 * @apiNote 基础服务类
 * @date 2022/4/6 下午3:25
 */
public abstract class BaseService<T> implements IService<T> {

    @Autowired
    protected UserDao userDao;

    @Autowired
    protected HistoryDao historyDao;

    @Autowired
    protected IllnessDao illnessDao;

    @Autowired
    protected IllnessKindDao illnessKindDao;

    @Autowired
    protected IllnessMedicineDao illnessMedicineDao;

    @Autowired
    protected MedicineDao medicineDao;

    @Autowired
    protected MedicalNewsDao medicalNewsDao;

    @Autowired
    protected PageviewDao pageviewDao;

}
