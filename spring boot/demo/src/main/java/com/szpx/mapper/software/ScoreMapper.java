package com.szpx.mapper.software;

import com.szpx.entity.software.AttendanceRecordsScore;
import com.szpx.entity.software.ExperimentReportScore;
import com.szpx.entity.software.FinalVisitScore;
import com.szpx.entity.software.ProjectChecksScore;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ScoreMapper {
    @Select("select * from attendance_records_score where stu_id = #{stuId}")
    AttendanceRecordsScore getAttendanceRecordsScoreByStuId(long stuId);

    @Select("select * from experiment_reports_score where stu_id = #{stuId}")
    ExperimentReportScore getExperimentReportScoreByStuId(long stuId);

    @Select("select * from final_visit_score where stu_id = #{stuId}")
    FinalVisitScore getFinalVisitScoreByStuId(long stuId);

    @Select("select * from project_checks_score where stu_id = #{stuId}")
    ProjectChecksScore getProjectChecksScoreByStuId(long stuId);
}
