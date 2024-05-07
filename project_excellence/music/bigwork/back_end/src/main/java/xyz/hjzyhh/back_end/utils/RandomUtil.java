package xyz.hjzyhh.back_end.utils;

import java.util.Random;

public class RandomUtil {
    public static Random random = new Random();

    public static String randomString(int length) {
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }

    public static long randomLong(long max) {
        return random.nextLong() % max;
    }
}
