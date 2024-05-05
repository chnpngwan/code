package com.szpx.mapper.software;

import com.szpx.entity.software.StudentDetailInfo;
import com.szpx.entity.software.StudentInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface StudentMapper {
    @Select("select stu_id, stu_number, stu_name from student_info where stu_id = #{id}")
    StudentInfo getStudentInfoById(long id);

    @Select("select t2.project_id,t3.stu_id,t3.stu_number,t2.group_number,\n" +
            "t2.class_grade,t2.class_name,t3.stu_id,\n" +
            "t3.stu_name,t2.leader_name,t1.projects_name as project_name,\n" +
            "t3.project_url,\n" +
            "FORMAT(((t4.one_score+t4.two_score+t4.three_sroce+t4.four_score+t4.five_score) / 5) * 0.2,2)+\n" +
            "FORMAT(((t5.one_score+t5.two_score+t5.three_sroce+t5.four_score+t5.five_score) / 5) * 0.2,2)+\n" +
            "FORMAT(((t6.one_score+t6.two_score+t6.three_sroce) / 3) * 0.3,2)+\n" +
            "FORMAT((t7.score) * 0.3,2)\n" +
            "as basic_score\n" +
            "from projects t1\n" +
            "join project_group_basic_info t2\n" +
            "on t2.project_id = t1.id\n" +
            "join student_info t3\n" +
            "on t3.stu_id = t2.student_id\n" +
            "join attendance_records_score t4\n" +
            "on t4.stu_id = t3.stu_id\n" +
            "join experiment_reports_score t5 on t5.stu_id = t4.stu_id\n" +
            "join project_checks_score t6 on t6.stu_id = t5.stu_id\n" +
            "join final_visit_score t7 on t7.stu_id = t6.stu_id\n" +
            "where t3.stu_id = #{stuId}")
    StudentDetailInfo getStudentDetailInfoByStudentId(long stuId);

    @Update("update student_info set project_url = #{projectUrl} where stu_id = #{stuId}")
    int stuUpdateProjectUrl(String projectUrl, long stuId);

    @Select("select project_url from student_info where stu_id = #{stuId}")
    StudentInfo getStudentUrlById(long stuId);
}
