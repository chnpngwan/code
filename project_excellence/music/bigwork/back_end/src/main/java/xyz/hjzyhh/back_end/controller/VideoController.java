package xyz.hjzyhh.back_end.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.DTO.video.UploadDTO;
import xyz.hjzyhh.back_end.DTO.video.VideoDTO;
import xyz.hjzyhh.back_end.service.VideoService;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;
import xyz.hjzyhh.back_end.utils.VOUtil;
import xyz.hjzyhh.back_end.vo.VideoVO;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/video")
public class VideoController {

    @Autowired
    VideoService videoService;

    public boolean checkPrefix(MultipartFile file,String type){
        if (file == null || file.isEmpty()) {
            return false;
        }
        String contentType = file.getContentType();
        if (StringUtils.isEmpty(contentType)) {
            return false;
        }
        return contentType.startsWith(type);
    }

    public boolean isImage(MultipartFile img){
        return checkPrefix(img,"image/");
    }
    public boolean isVideo(MultipartFile video){
        return checkPrefix(video,"video/");
    }


    @PostMapping("/upload")
    public Result<Object> upload(@RequestParam("video") MultipartFile video,
                                 @RequestParam("cover") MultipartFile cover,
                                 @RequestParam("title") String title,
                                 @RequestParam("duration") int duration,
                                 @RequestParam("description") String description,
                                 @RequestParam("tags") List<Integer> tags,
                                 @RequestParam("open") boolean open,
                                 @RequestParam("cid") int cid,
                                 HttpSession session) {
        if(!isImage(cover)) throw new RuntimeException("文件类型有误");
        if(!isVideo(video)) throw new RuntimeException("文件类型有误");
        long uid = (long) session.getAttribute("uid");
        UploadDTO upload = new UploadDTO();
        upload.setCover(cover);
        upload.setVideo(video);
        upload.setDuration(duration);
        upload.setTitle(title);
        upload.setCreator(uid);
        upload.setDescription(description);
        upload.setTags(tags);
        upload.setOpen(open);
        upload.setCid(cid);
        int res = videoService.upload(upload);
        if (res != 0) {
            return ResultUtil.success(null);
        }
        return ResultUtil.failure(ResultUtil.UPLOAD_FILE_ERROR, ResultUtil.UPLOAD_FILE_MSG);
    }

    @GetMapping("/{id}")
    public Result<VideoVO> getInfo(@PathVariable("id") long id, HttpSession session) {
        long uid = 0;
        if (session.getAttribute("uid") != null) {
            uid = (long) session.getAttribute("uid");
        }
        VideoDTO videoDTO = videoService.get(id, uid);
        if (videoDTO != null) {
            VideoVO videoVO = VOUtil.<VideoDTO, VideoVO>swap(videoDTO, VideoVO.class);
            return ResultUtil.<VideoVO>success(videoVO);
        }
        return ResultUtil.failure(500, "");
    }

    @GetMapping("/recommend/{page}")
    public Result<List<VideoVO>> recommend(@PathVariable("page")int page) {
        return ResultUtil.success(videoService.recommend(page));
    }

    @PostMapping("/delete/{vid}")
    public Result<Object> delete(@PathVariable("vid") long vid, HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        int delete = videoService.delete(vid, uid);
        if (delete == 1) return ResultUtil.success(null);
        else return ResultUtil.failure(500, "删除失败");
    }

    @PostMapping("/modify")
    public Result<Object> modify(@RequestParam("id") long id,
                                 @RequestParam("cover") MultipartFile cover,
                                 @RequestParam("title") String title,
                                 @RequestParam("description") String description,
                                 HttpSession session) {
        long uid = (long) session.getAttribute("uid");
        UploadDTO new_data = new UploadDTO();
        new_data.setId(id);
        new_data.setCover(cover);
        new_data.setTitle(title);
        new_data.setDescription(description);
        int modify = videoService.modify(new_data, uid);
        if (modify == 1) return ResultUtil.success(null);
        else return ResultUtil.failure(500, "删除失败");
    }

    @GetMapping("/tag/{tid}/{page}")
    public Result<List<VideoVO>> getByTag(@PathVariable("tid") int tid,
                                          @PathVariable("page") int page) {
        List<VideoVO> videos = videoService.getByTag(tid, page).stream()
                .map(videoDTO -> VOUtil.swap(videoDTO, VideoVO.class))
                .collect(Collectors.toList());
        return ResultUtil.success(videos);

    }

    @GetMapping("/user/{uid}")
    public Result<List<VideoVO>> getVideoByUid(@PathVariable("uid") long uid, @RequestParam("page") int page, HttpSession session) {
        long option_uid = (long) session.getAttribute("uid");
        return ResultUtil.success(videoService.getVideoByUid(uid, option_uid, page));
    }

    @GetMapping("/class/{cid}")
    public Result<List<VideoVO>> getVideoByClass(@PathVariable("cid") int cid, HttpSession session) {
        return ResultUtil.success(videoService.getVideoByClass(cid, (long) session.getAttribute("uid")));
    }
}
