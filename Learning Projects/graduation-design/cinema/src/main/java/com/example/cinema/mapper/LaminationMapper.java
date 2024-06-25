package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.entity.Lamination;
import com.example.cinema.vo.LaminationVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LaminationMapper extends BaseMapper<Lamination> {
    List<LaminationVO> getLaminationPage(@Param("keywords") String keywords,
                                         @Param("start") Long start,
                                         @Param("size") Long size);
    Long getLaminationPageTotal(@Param("keywords") String keywords);
}
