package com.szpx.service.software;

import com.szpx.entity.software.StudentDetailInfo;
import com.szpx.entity.software.StudentInfo;

public interface StudentService {
    StudentInfo getStudentInfoById(long id);

    StudentDetailInfo getStudentDetailInfoByStudentId(long stuId);

    int stuUpdateProjectUrl(String projectUrl, long stuId);

    StudentInfo getStudentUrlById(long stuId);
}


