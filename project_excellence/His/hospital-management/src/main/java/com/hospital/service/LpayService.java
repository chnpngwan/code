package com.hospital.service;

import com.hospital.entity.Lrecord;
import com.hospital.entity.Pay;
import com.hospital.entity.Register;

import java.util.List;

public interface LpayService {

    int updPay(Register register);
    int addPay(Register register);
    List<Pay> selPays(Register register);
    List<Lrecord> selSurplus(Lrecord lrecord);
}
