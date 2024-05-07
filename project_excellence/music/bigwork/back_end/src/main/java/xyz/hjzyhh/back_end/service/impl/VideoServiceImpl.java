package xyz.hjzyhh.back_end.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.hjzyhh.back_end.DTO.video.UploadDTO;
import xyz.hjzyhh.back_end.DTO.video.VideoDTO;
import xyz.hjzyhh.back_end.mapper.ClassMapper;
import xyz.hjzyhh.back_end.mapper.TagMapper;
import xyz.hjzyhh.back_end.mapper.UserMapper;
import xyz.hjzyhh.back_end.mapper.VideoMapper;
import xyz.hjzyhh.back_end.pojo.TagPO;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;
import xyz.hjzyhh.back_end.scheduled.ConvertVideoSchedul;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.service.VideoService;
import xyz.hjzyhh.back_end.utils.*;
import xyz.hjzyhh.back_end.vo.UserVO;
import xyz.hjzyhh.back_end.vo.VideoVO;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class VideoServiceImpl implements VideoService {

    public VideoServiceImpl() {
        noUserPO = new UserPO();
        noUserPO.setUsername("用户已注销");
        noUserPO.setDescription("");
    }

    @Autowired
    TagMapper tagMapper;

    @Autowired
    VideoMapper videoMapper;

    @Autowired
    ClassMapper classMapper;

    @Autowired
    UserService userService;
    @Autowired
    UserMapper userMapper;

    @Autowired
    RedisTemplate<String,String> redisTemplate;

    private final int PAGE_LIMIT = 20;

    private UserPO noUserPO;

    private List<TagPO> getTags(long vid) {
        List<Integer> tids = videoMapper.getVideoTags(vid);
        return tids.stream()
                .map(tid -> tagMapper.findOne(tid))
                .collect(Collectors.toList());
    }


    private boolean checkVideoAccess(long uid, VideoPO video) {
        if (video.isOpen()) {
            return true;
        }
        int cid = video.getCid();
        if(video.getCreator() == uid) return true;
        return classMapper.checkInClass(cid, uid) != null;
    }

    private boolean checkVideoAccess(long uid, VideoDTO video) {
        if (video.isOpen()) {
            return true;
        }
        int cid = video.getCid();
        return classMapper.checkInClass(cid, uid) != null;
    }

    @Transactional
    @Override
    public int upload(UploadDTO upload) {
        UserPO user = userService.findOne(upload.getCreator());
        if (user.isTeacher()) {
            VideoPO videoPO = VOUtil.swap(upload, VideoPO.class);

            long videoId = RedisUtil.getId("videoId");
            videoPO.setId(videoId);
            videoPO.setVideo(FileUtils.saveVideo(upload.getVideo()));
            videoPO.setCover(FileUtils.saveCover(upload.getCover()));
            int insert = videoMapper.insert(videoPO);
            upload.getTags().stream().forEach(item -> videoMapper.addVideoTag(videoId, item));
            videoMapper.submitReview(videoId);
            // video的主键添加到redis，为异步处理视频文件做准备
            redisTemplate.opsForList().leftPush(ConvertVideoSchedul.KEY, String.valueOf(videoId));
            return insert;

        } else {
            throw new RuntimeException("该用户没有权限");
        }
    }

    @Override
    public VideoPO getVideoPOById(long vid) {
        VideoPO videoPO = RedisUtil.<VideoPO>getVideo(String.valueOf(vid));
        if (videoPO == null) {
            videoPO = videoMapper.findById(vid);
            if (videoPO != null)
                RedisUtil.setVideo(String.valueOf(videoPO.getId()), videoPO);
        }
        return videoPO;
    }

    @Override
    public List<VideoVO> recommend(int page) {
        List<VideoPO> videos = videoMapper.findRange(PAGE_LIMIT * (page - 1), PAGE_LIMIT);
        List<VideoVO> res = new ArrayList<>(20);
        for (VideoPO video : videos) {
            VideoVO vo = VOUtil.swap(video, VideoVO.class);
            long uid = video.getCreator();
            UserPO creator = userService.findOne(uid);
            if (creator == null) {
                creator = noUserPO;
            }
            vo.setCreator(VOUtil.of(creator));
            res.add(vo);
        }
        return res;
    }

    @Override
    public VideoDTO get(long id, long uid) {
        VideoPO videoPO = getVideoPOById(id);
        if (videoPO != null) {
            if (!checkVideoAccess(uid, videoPO)) {
                videoPO.setVideo("");
            }
            if (videoPO != null) {
                UserPO userPO = userService.findOne(videoPO.getCreator());
                if (userPO == null) {
                    userPO = noUserPO;
                }
                VideoDTO video = VOUtil.swap(videoPO, VideoDTO.class);
                video.setCreator(userPO);
                video.setTags(getTags(video.getId()));
                return video;
            }
        }
        return null;
    }

    @Override
    public int delete(long id, long uid) {
        VideoPO videoPO = getVideoPOById(id);
        if (videoPO.getCreator() == uid) {
            RedisUtil.delVideo(String.valueOf(id));
            int delete = videoMapper.delete(id);
            return delete;
        }
        throw new RuntimeException("没有权限");
    }

    @Override
    public int modify(UploadDTO new_data, long uid) {
        VideoPO videoPO = new VideoPO();
        if(new_data.getCover() != null)
            videoPO.setCover(FileUtils.saveCover(new_data.getCover()));
        videoPO.setDescription(new_data.getDescription());
        videoPO.setTitle(new_data.getTitle());
        return videoMapper.update(new_data.getId(), videoPO);
    }

    @Override
    public List<VideoDTO> getByTag(int tid, int page) {
        long offset  = PAGE_LIMIT * (page - 1);
        List<Long> vids = videoMapper.getTagVideos(tid, PAGE_LIMIT, offset);
        return vids.stream().map(id -> get(id, 0L)).filter(Objects::nonNull).collect(Collectors.toList());
    }

    private VideoVO getVideoVO(VideoPO videoPO) {
        VideoVO videoVO = VOUtil.swap(videoPO, VideoVO.class);
        videoVO.setTags(getTags(videoVO.getId()));
        videoVO.setCreator(VOUtil.swap(userService.findOne(videoPO.getCreator()), UserVO.class));
        return videoVO;
    }

    @Override
    public List<VideoVO> getVideoByUid(long uid, long option_uid, int page) {
        List<VideoPO> videoPOS = null;
        if (uid == option_uid) {
            videoPOS = videoMapper.findMine(uid, PAGE_LIMIT, PAGE_LIMIT * (page - 1));
        } else {
            videoPOS = videoMapper.findByCreator(uid, PAGE_LIMIT, PAGE_LIMIT * (page - 1));
        }
        return videoPOS.stream().map(this::getVideoVO).collect(Collectors.toList());
    }

    @Override
    public List<VideoPO> getVideoByClass(int cid, long option_uid) {
        return videoMapper.getVideoByClass(cid);
    }
}
