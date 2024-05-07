package com.study.springclimb.music.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.study.springclimb.music.dao.SongDao;
import com.study.springclimb.music.entity.Song;
import com.study.springclimb.music.service.SongService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 歌曲(Song)表服务实现类
 *
 * @author makejava
 * @since 2021-06-17 14:19:43
 */
@Service("songService")
public class SongServiceImpl extends ServiceImpl<SongDao, Song> implements SongService {


    @Resource
    private  SongDao dao;

    @Override
    public Boolean insertSong(Song song) {
        int insert = dao.insert(song);
        return  insert>0;
    }

    @Override
    public List<Song> songOfSingerId(Integer id) {
        QueryWrapper<Song> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("singer_id",id);//查询歌手id为xxx的歌曲列表
        List<Song> songs = dao.selectList(queryWrapper);
        return songs;
    }
}
