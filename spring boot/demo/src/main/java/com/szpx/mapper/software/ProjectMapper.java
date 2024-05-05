package com.szpx.mapper.software;

import com.szpx.entity.software.ProjectTask;
import com.szpx.entity.software.StuProjectBasicInfo;
import com.szpx.utils.pageutils.PageUtil;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProjectMapper {
    @Select("select t2.project_id,t3.stu_id,t2.class_grade,t2.class_name,t3.project_url,\n" +
            "t3.stu_name,t2.leader_name,t1.projects_name as project_name,\n" +
            "FORMAT(FORMAT(((t4.one_score+t4.two_score+t4.three_sroce+t4.four_score+t4.five_score) / 5) * 0.2,2)+\n" +
            "FORMAT(((t5.one_score+t5.two_score+t5.three_sroce+t5.four_score+t5.five_score) / 5) * 0.2,2)+\n" +
            "FORMAT(((t6.one_score+t6.two_score+t6.three_sroce) / 3) * 0.3,2)+\n" +
            "FORMAT((t7.score) * 0.3,2),2)\n" +
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
            "GROUP BY t3.stu_id,t2.leader_name")
    List<StuProjectBasicInfo> getBasicProjectInfo(PageUtil pageUtil);


    @Select("select t2.project_task from projects t1 join project_task t2\n" +
            "on t2.project_id = t1.id\n" +
            "join project_task_student t3 on t3.project_task_id = t2.id\n" +
            "where t3.stu_id =  #{stuId}")

    List<ProjectTask> getAllProjectTaskByStuId(long stuId);

}
