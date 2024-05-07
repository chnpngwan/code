package xyz.hjzyhh.back_end.admin.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.hjzyhh.back_end.admin.PO.VideoSelector;
import xyz.hjzyhh.back_end.admin.mapper.VideoAdminMapper;
import xyz.hjzyhh.back_end.admin.service.VideoAdminService;
import xyz.hjzyhh.back_end.mapper.UserMapper;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.service.VideoService;

import java.util.List;

@Service
public class VideoAdminServiceImpl implements VideoAdminService {
    @Autowired
    VideoAdminMapper videoAdminMapper;

    @Autowired
    UserMapper userMapper; // Assuming UserMapper is available and properly configured

    @Autowired
    VideoService videoService;

    @Autowired
    UserService userService;

    @Override
    public List<VideoPO> getBySelector(VideoSelector videoSelector, int limit, long offset) {
        return videoAdminMapper.getUserBySeletor(videoSelector, limit, offset);
    }

    @Transactional
    @Override
    public int ban(long id) {
        UserPO user = userService.findOne(videoAdminMapper.getVideoPOById(id).getCreator());
        if (user != null) {
            userMapper.updateWorks(user.getId(), user.getWorks() - 1);
        }
        return videoAdminMapper.ban(id);
    }

    @Transactional
    @Override
    public int unban(long id) {
        UserPO user = userService.findOne(videoAdminMapper.getVideoPOById(id).getCreator());
        if (user != null) {
            userMapper.updateWorks(user.getId(), user.getWorks() + 1);
        }
        return videoAdminMapper.unban(id);
    }

    @Transactional
    @Override
    public int delete(long id) {
        UserPO user = userService.findOne(videoAdminMapper.getVideoPOById(id).getCreator());
        if (user != null) {
            userMapper.updateWorks(user.getId(), user.getWorks() - 1);
        }
        return videoAdminMapper.delete(id);
    }

    @Transactional
    @Override
    public int undelete(long id) {
        UserPO user = userService.findOne(videoAdminMapper.getVideoPOById(id).getCreator());
        if (user != null) {
            userMapper.updateWorks(user.getId(), user.getWorks() + 1);
        }
        return videoAdminMapper.undelete(id);
    }
}
