package com.crm.service.impl;

import com.crm.dao.TbEmpMapper;
import com.crm.entity.TbEmp;
import com.crm.entity.Tb_emp_dept;
import com.crm.service.Tb_empService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.crm.service.impl
 * ClassName:     Tb_empServiceImpl
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 10 33
 **/
@Service
public class Tb_empServiceImpl implements Tb_empService {

    @Resource
    private TbEmpMapper mapper;
    @Override
    public List<Tb_emp_dept> selectAll(Tb_emp_dept tb_emp_dept) {
        // TODO Auto-generated method stub
        System.out.println(tb_emp_dept.getEmpName());
        System.out.println(tb_emp_dept.getEmpPosition());

        if (tb_emp_dept.getEmpName().equals("")&&tb_emp_dept.getEmpPosition().equals("")) {
            List<Tb_emp_dept> list=mapper.selectEmp();
            return list;
        }else {
            List<Tb_emp_dept> list=mapper.selectEmpLike(tb_emp_dept);
            return list;
        }

    }
    @Override
    public int add(TbEmp tbEmp) {
        // TODO Auto-generated method stub
        int rows=mapper.insert(tbEmp);
        return rows;
    }
    @Override
    public int delete(int id) {
        // TODO Auto-generated method stub
        return mapper.deleteByPrimaryKey(id);
    }

}
