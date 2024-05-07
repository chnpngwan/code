package xyz.hjzyhh.back_end.admin.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.hjzyhh.back_end.DTO.video.VideoDTO;
import xyz.hjzyhh.back_end.admin.DTO.VideoCheckDTO;
import xyz.hjzyhh.back_end.admin.PO.VideoCheckPO;
import xyz.hjzyhh.back_end.admin.mapper.VideoCheckAdminMapper;
import xyz.hjzyhh.back_end.admin.service.VideoCheckAdminService;
import xyz.hjzyhh.back_end.mapper.UserMapper;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.service.VideoService;
import xyz.hjzyhh.back_end.utils.RedisUtil;
import xyz.hjzyhh.back_end.utils.VOUtil;

import java.util.ArrayList;
import java.util.List;

@Service
public class VideoCheckAdminServiceImpl implements VideoCheckAdminService {
    @Autowired
    VideoCheckAdminMapper videoCheckAdminMapper;

    @Autowired
    VideoService videoService;

    @Autowired
    UserService userService;

    @Autowired
    UserMapper userMapper;

    private final int NUM_OF_PAGE = 5;

    @Transactional
    @Override
    public List<VideoCheckDTO> get(int aid) {
        List<VideoCheckPO> checks = videoCheckAdminMapper.getChecking(aid);
        if (checks.size() < NUM_OF_PAGE) {
            checks.addAll(videoCheckAdminMapper.getVideoChecks(NUM_OF_PAGE-checks.size(), 0));
        }

        List<VideoCheckDTO> res = new ArrayList<>();
        for (VideoCheckPO check : checks) {
            videoCheckAdminMapper.changeStatus(check.id, 1, aid);
            VideoPO videoPO = videoCheckAdminMapper.findById(check.vid);
            VideoDTO videoDTO = VOUtil.swap(videoPO, VideoDTO.class);
            videoDTO.setCreator(userService.findOne(videoPO.getCreator()));
            VideoCheckDTO videoCheck = VOUtil.swap(videoDTO, VideoCheckDTO.class);
            videoCheck.setCheck_id(check.id);
            res.add(videoCheck);
        }
        return res;

    }

    @Override
    public int uncheck(List<Long> ids, int aid) {
        int count = 0;
        for (Long id : ids) {
            count += videoCheckAdminMapper.changeStatus(id, 0, aid);
        }
        if (count == ids.size()) {
            return 1;
        }
        return 0;
    }

    @Transactional
    @Override
    public int pass(long id, int aid) {
        VideoCheckPO check = videoCheckAdminMapper.getCheck(id);
        videoCheckAdminMapper.publishVideo(check.vid);
        UserPO user = userService.findOne(videoCheckAdminMapper.findById(check.vid).getCreator());
        if(user.getId() != 0) {
            userMapper.updateWorks(user.getId(), user.getWorks() + 1);
            RedisUtil.delUser(String.valueOf(user.getId()));
        }
        return videoCheckAdminMapper.changeStatus(id, 2, aid);
    }

    @Override
    public int unpass(long id, int aid) {
        return videoCheckAdminMapper.changeStatus(id, -1, aid);
    }
}
