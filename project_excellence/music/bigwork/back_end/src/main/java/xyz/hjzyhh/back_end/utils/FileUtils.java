package xyz.hjzyhh.back_end.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.annotation.NoSample;
import xyz.hjzyhh.back_end.conf.WebConfig;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

/**
 * 存储文件工具类
 */
@Component
public class FileUtils {

    public FileUtils(ServletContext servletContext, WebConfig webConfig) {
        FileUtils.CONTEXTPATH = servletContext.getContextPath();
        FileUtils.webConfig = webConfig;

        String filePath = webConfig.externalFolderPath;
        System.out.println("filePath : " + filePath);
        AVATAR_PATH = filePath + PUBLIC_DIR + "/" + AVATAR_DIR;
        File avatarDir = new File(AVATAR_PATH);
        if (!avatarDir.exists()) {
            avatarDir.mkdirs();
        }
        COVER_PATH = filePath + PUBLIC_DIR + "/" + COVER_DIR;
        File coverDir = new File(COVER_PATH);
        if (!coverDir.exists()) {
            coverDir.mkdirs();
        }
        AUTH_IMGS_PATH = filePath + PUBLIC_DIR + "/" + AUTH_IMGS_DIR;
        File authDir = new File(AUTH_IMGS_PATH);
        if (!authDir.exists()) {
            authDir.mkdirs();
        }
        VIDEO_PATH = filePath + PUBLIC_DIR + "/" + VIDEO_DIR;
        File videoDir = new File(VIDEO_PATH);
        if (!videoDir.exists()) {
            videoDir.mkdirs();
        }
    }

    private static String CONTEXTPATH = "";
    public static String AVATAR_PATH = "";
    private static String AVATAR_DIR = "avatars";
    public static String COVER_PATH = "";
    private static String COVER_DIR = "covers";
    public static String VIDEO_PATH = "";
    private static String VIDEO_DIR = "videos";
    public static String AUTH_IMGS_PATH = "";
    private static String AUTH_IMGS_DIR = "authimg";
    private static String PUBLIC_DIR = "";

    private static List<String> FIELD_NAMES = Arrays.asList("cover", "avatar", "video");

    public static WebConfig webConfig;


    private static String getPrefix(MultipartFile file) {
        // 获取文件类型
        String fileName = file.getContentType();
        // 获取文件后缀
        String pref = fileName.indexOf("/") != -1 ? fileName.substring(fileName.lastIndexOf("/") + 1, fileName.length()) : null;
        String prefix = "." + pref;
        return prefix;
    }

    private static String saveFile(MultipartFile file, String path) {
        String prefix = getPrefix(file);
        String fileName = UUID.randomUUID().toString().replace("-", "") + prefix;
        // 用uuid作为文件名，防止生成的临时文件重复
        final File rfile = new File(path, fileName);
        try {
            file.transferTo(rfile);
            return fileName;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static void addContextPath(Object obj) {
        if(obj == null)return ;
        if (obj instanceof String) return;
        if(obj instanceof  List) ((List<?>) obj).forEach(FileUtils::addContextPath);
        Field[] declaredFields = obj.getClass().getDeclaredFields();
        for (Field field : declaredFields) {
            NoSample noSample = field.getAnnotation(NoSample.class);
            if (noSample == null) {
                String name = field.getName();
                for (String fieldName : FIELD_NAMES) {
                    if (name.equalsIgnoreCase(fieldName)) {
                        try {
                            field.setAccessible(true);
                            field.set(obj, addContextPath((String) field.get(obj)));
                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } else {
                try {
                    field.setAccessible(true);
                    addContextPath(field.get(obj));
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static String addContextPath(String filePath) {
        return CONTEXTPATH + webConfig.fileAccassPrefix + "/" + filePath;
    }

    public static String saveAvatar(MultipartFile avatar) {
        return AVATAR_DIR + "/" + saveFile(avatar, AVATAR_PATH);
    }

    public static String saveCover(MultipartFile cover) {
        return COVER_DIR + "/" + saveFile(cover, COVER_PATH);

    }

    public static String saveAuthImg(MultipartFile authimg) {
        return AUTH_IMGS_DIR + "/" + saveFile(authimg, AUTH_IMGS_PATH);
    }

    public static String saveVideo(MultipartFile video) {
        return VIDEO_DIR + "/" + saveFile(video, VIDEO_PATH);
    }
}
