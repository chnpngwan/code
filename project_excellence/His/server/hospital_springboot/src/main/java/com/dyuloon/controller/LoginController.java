package com.dyuloon.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dyuloon.entity.Doctor;
import com.dyuloon.entity.Patient;
import com.dyuloon.entity.UserAdmin;
import com.dyuloon.entity.customEntity.LoginEntity;
import com.dyuloon.service.DoctorService;
import com.dyuloon.service.PatientService;
import com.dyuloon.service.UserAdminService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
@RestController
@RequestMapping("/user")
public class LoginController {
    @Autowired
    DoctorService doctorService;
    @Autowired
    UserAdminService userAdminService;
    @Autowired
    PatientService patientService;

    // 用户登录
    @PostMapping("/login")
    public ResultVO login(@RequestBody LoginEntity loginEntity) {
        ResultVO resultVO = null;
        // 判断是否医生登录
        QueryWrapper<Doctor> doctorQueryWrapper = new QueryWrapper<>();
        doctorQueryWrapper.lambda().eq(Doctor::getDoctorTel, loginEntity.getTel());
        doctorQueryWrapper.lambda().eq(Doctor::getDoctorPassword, loginEntity.getPassword());
        Doctor doctor = this.doctorService.getOne(doctorQueryWrapper);
        if (doctor == null) {
            // 判断患者登录
            QueryWrapper<Patient> patientQueryWrapper = new QueryWrapper<>();
            patientQueryWrapper.lambda().eq(Patient::getPatientTel, loginEntity.getTel());
            patientQueryWrapper.lambda().eq(Patient::getPatientPassword, loginEntity.getPassword());
            Patient patient = this.patientService.getOne(patientQueryWrapper);
            if (patient == null) {
                // 判断管理员登录
                QueryWrapper<UserAdmin> userAdminQueryWrapper = new QueryWrapper<>();
                userAdminQueryWrapper.lambda().eq(UserAdmin::getAdminTel, loginEntity.getTel());
                userAdminQueryWrapper.lambda().eq(UserAdmin::getAdminPassword, loginEntity.getPassword());
                UserAdmin userAdmin = this.userAdminService.getOne(userAdminQueryWrapper);
                if (userAdmin == null) {
                    resultVO = ResultVOUtil.fail("用户名或密码错误");
                } else {
                    resultVO = ResultVOUtil.success(userAdmin, "欢迎管理员 " + userAdmin.getAdminName() + " 登入！");
                }
            } else {
                String name = patient.getPatientName() == null ? "某用户" : patient.getPatientName();
                resultVO = ResultVOUtil.success(patient, "欢迎用户 " + name + " 登入！");
            }
        } else {
            String name = doctor.getDoctorName() == null ? "某医生" : doctor.getDoctorName();
            resultVO = ResultVOUtil.success(doctor, "欢迎医生 " + name + " 登入！");
        }
        return resultVO;
    }

    // 患者注册
    @PostMapping("/register")
    public ResultVO register(@RequestBody Patient patient) {
        boolean save = this.patientService.save(patient);
        ResultVO resultVO = save ? ResultVOUtil.success(null, "注册成功！") : ResultVOUtil.fail("注册失败！");
        return resultVO;
    }
}