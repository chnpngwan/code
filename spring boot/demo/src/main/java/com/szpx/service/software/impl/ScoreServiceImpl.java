package com.szpx.service.software.impl;

import com.alibaba.fastjson.JSONObject;
import com.szpx.entity.software.AttendanceRecordsScore;
import com.szpx.entity.software.ExperimentReportScore;
import com.szpx.entity.software.FinalVisitScore;
import com.szpx.entity.software.ProjectChecksScore;
import com.szpx.mapper.software.ScoreMapper;
import com.szpx.service.software.ScoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DecimalFormat;

@Service
public class ScoreServiceImpl implements ScoreService {

    @Resource
    ScoreMapper scoreMapper;


    @Override
    public JSONObject showAllScore(long stuId) {
        JSONObject jsonObject = new JSONObject(true);

        AttendanceRecordsScore attendanceRecordsScoreByStuId = scoreMapper.getAttendanceRecordsScoreByStuId(stuId);
        ExperimentReportScore experimentReportScoreByStuId = scoreMapper.getExperimentReportScoreByStuId(stuId);
        FinalVisitScore finalVisitScoreByStuId = scoreMapper.getFinalVisitScoreByStuId(stuId);
        ProjectChecksScore projectChecksScoreByStuId = scoreMapper.getProjectChecksScoreByStuId(stuId);

        //计算结果保留两位小数
        DecimalFormat decimalFormat = new DecimalFormat("#.00");

        //计算考勤记录小计
        double attendanceSubtotal = (attendanceRecordsScoreByStuId.getOneScore() + attendanceRecordsScoreByStuId.getTwoScore()
                + attendanceRecordsScoreByStuId.getThreeSroce() + attendanceRecordsScoreByStuId.getFourScore()
                + attendanceRecordsScoreByStuId.getFiveScore()) / 5;
        attendanceRecordsScoreByStuId.setAttendanceScores(Double.valueOf(decimalFormat.format(attendanceSubtotal * 0.2)));
        attendanceRecordsScoreByStuId.setSubtotal(Double.valueOf(decimalFormat.format(attendanceSubtotal)));

        //计算实验报告小计
        double experimentSubtotal = (experimentReportScoreByStuId.getOneScore() + experimentReportScoreByStuId.getTwoScore()
                + experimentReportScoreByStuId.getThreeSroce() + experimentReportScoreByStuId.getFourScore()
                + experimentReportScoreByStuId.getFiveScore()) / 5;
        experimentReportScoreByStuId.setSubtotal(Double.valueOf(decimalFormat.format(experimentSubtotal)));
        experimentReportScoreByStuId.setExperimentReportScore(Double.valueOf(decimalFormat.format(experimentSubtotal)) * 0.2);

        //计算项目检查小计
        double projectChecksSubtotal = (projectChecksScoreByStuId.getOneScore() + projectChecksScoreByStuId.getTwoScore()
                + projectChecksScoreByStuId.getThreeSroce()) / 3;
        projectChecksScoreByStuId.setSubtotal(Double.valueOf(decimalFormat.format(projectChecksSubtotal)));
        projectChecksScoreByStuId.setProjectChecksScore(Double.valueOf(decimalFormat.format(projectChecksSubtotal)) * 0.3);

        finalVisitScoreByStuId.setFinalVisitScore(Double.valueOf(decimalFormat.format(finalVisitScoreByStuId.getScore() * 0.3)));

        double finalScore = attendanceRecordsScoreByStuId.getAttendanceScores() + experimentReportScoreByStuId.getExperimentReportScore()
                + finalVisitScoreByStuId.getFinalVisitScore() + projectChecksScoreByStuId.getProjectChecksScore();


        jsonObject.put("attendanceRecordsScore", attendanceRecordsScoreByStuId);
        jsonObject.put("experimentReportScore", experimentReportScoreByStuId);
        jsonObject.put("projectChecksScore", projectChecksScoreByStuId);
        jsonObject.put("finalVisitScore", finalVisitScoreByStuId);
        jsonObject.put("finalScore", decimalFormat.format(finalScore));


        return jsonObject;
    }
}
