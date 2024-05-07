package xyz.hjzyhh.back_end.utils;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 视频转码
 */
public class VideoUtil {
    private VideoUtil(){}

    private static String ffmpegpath = "ffmpeg";

    /**
     * 将path 视频文件转成m3u8格式 存储到outPath目录下
     * @param file 视频文件路径 绝对路径
     * @param outPath 输出目录
     * @param outFile 输出文件名称
     * @return
     */
    public static boolean video2M3u8(String file,String outPath,String outFile){
        File outdir = new File(outPath);
        if(!outdir.exists()){
            outdir.mkdirs();
        }else{
            outdir.deleteOnExit();
            outdir.mkdirs();
        }
        System.out.println("创建输出目录");
        File out = new File(outdir, outFile);
        System.out.println("创建输出文件");
        List<String> commend = new java.util.ArrayList<>();
        commend.add(ffmpegpath);
        commend.add("-i");
        commend.add(file);
//        commend.add("-init_hw_device");
//        commend.add("cuda=1");

        // h264_nvenc是NVIDIA GPU加速的H.264编码器
        commend.add("-c:v");
//        commend.add("libx264");
        commend.add("h264_nvenc"); // 使用GPU加速，避免CPU占满，导致服务失效
        // h264_cuvid是NVIDIA GPU加速的H.264解码器  当前ffmpeg暂时不支持
//        commend.add("h264_cuvid");
//        commend.add("-c:v");
//        commend.add("mpeg2_cuvid");

//        commend.add("-gpu");
//        commend.add("1");

        commend.add("-preset");
        commend.add("fast");
        commend.add("-hls_time");
        commend.add("20");
        commend.add("-hls_list_size");
        commend.add("0");
        commend.add("-c:a");
        commend.add("aac");
        commend.add("-strict");
        commend.add("-2");
        commend.add("-f");
        commend.add("hls");
        commend.add(out.getAbsolutePath());
        System.out.println("构建执行命令");
        ProcessBuilder builder = new ProcessBuilder();//java
        builder.command(commend);
        Process p = null;
        try {
            System.out.println("开始执行命令");
            builder.inheritIO();
            p = builder.start();

            // 开启线程消费ffmpeg的输出 避免阻塞
            Process finalP = p;
            Thread outputThread = new Thread(() -> {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(finalP.getInputStream()))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
//                        System.out.println(line);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });
            outputThread.start();


            System.out.println("等待执行");
            int i = p.waitFor();
//            System.out.println("------>"+i);
            System.out.println("执行完毕，销毁资源");
            p.destroy();
            return i == 0;
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        long start = System.currentTimeMillis();
        if (video2M3u8("E:\\javaWeb_source\\video\\JavaWeb01.mp4","E:\\javaWeb_source\\video\\JavaWeb01\\","JavaWeb01.m3u8")) {
            System.out.println("运行成功");
        }
        System.out.println("耗时"+(System.currentTimeMillis()-start)/1000);
    }
}
