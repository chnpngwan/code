package xyz.hjzyhh.back_end.service;

import xyz.hjzyhh.back_end.DTO.video.UploadDTO;
import xyz.hjzyhh.back_end.DTO.video.VideoDTO;
import xyz.hjzyhh.back_end.pojo.VideoPO;
import xyz.hjzyhh.back_end.vo.VideoVO;

import java.util.List;

public interface VideoService {
    default int upload(UploadDTO upload) {
        return 0;
    }

    VideoPO getVideoPOById(long vid);

    default List<VideoVO> recommend(int page) {
        return null;
    }

    default VideoDTO get(long id, long uid) {
        return null;
    }

    default int delete(long id, long uid) {
        return 0;
    }

    default int modify(UploadDTO new_data, long uid) {
        return 0;
    }

    List<VideoDTO> getByTag(int tid,int page);

    List<VideoVO> getVideoByUid(long uid,long option_uid,int page);

    List<VideoPO> getVideoByClass(int cid,long option_uid);
}
