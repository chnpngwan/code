package xyz.hjzyhh.back_end.scheduled;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import xyz.hjzyhh.back_end.admin.mapper.VideoAdminMapper;
import xyz.hjzyhh.back_end.mapper.VideoMapper;
import xyz.hjzyhh.back_end.pojo.VideoPO;
import xyz.hjzyhh.back_end.service.VideoService;
import xyz.hjzyhh.back_end.utils.FileUtils;
import xyz.hjzyhh.back_end.utils.VideoUtil;

import java.io.File;

/**
 * 视频转码定时扫描
 */
@Component
public class ConvertVideoSchedul {

    // redis存储处理视频ID的key list类型
    public static final String KEY = "video_convert";


    @Autowired
    RedisTemplate<String,String> redisTemplate;

    @Autowired
    VideoService videoService;

    @Autowired
    VideoMapper videoMapper;

    @Autowired
    VideoAdminMapper videoAdminMapper;
    // 定时处理video视频
    @Scheduled(cron = "0/10 * * * * *")
    public void videoConvert(){
        String s = redisTemplate.opsForList().rightPop(KEY);
        while(s != null){
            try {
                long vid = Long.parseLong(s);
                VideoPO videoPO = videoAdminMapper.getVideoPOById(vid);
                String videoPath = videoPO.getVideo();
                String absolutePath = new File(FileUtils.VIDEO_PATH).getParentFile().getAbsolutePath();
                File videoPathAbsFile = new File(absolutePath,videoPath);// 输入文件
                File videoPathAbsDir = videoPathAbsFile.getParentFile();
                String fileName = videoPathAbsFile.getName();
                fileName = fileName.substring(0, fileName.lastIndexOf('.')); // 获取文件名
                File videoPathOutputDir = new File(videoPathAbsDir, fileName); // 获取输出目录
                String outputFilename = fileName + ".m3u8";
                if (VideoUtil.video2M3u8(videoPathAbsFile.getAbsolutePath(), videoPathOutputDir.getAbsolutePath(), outputFilename)) {
                    // 转换成功的话,重新存储videoURL
                    File file = new File(videoPathOutputDir, outputFilename);
                    String new_videoUrl = file.getAbsolutePath().substring(FileUtils.webConfig.externalFolderPath.length()).replace("\\", "/");
                    videoMapper.updateVideoUrl(vid, new_videoUrl);
                }
            }catch (Exception e){
                // 塞回去
                redisTemplate.opsForList().leftPush(KEY,s);
            }
            s = redisTemplate.opsForList().rightPop(KEY);
        }
    }

}
