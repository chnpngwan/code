package com.szpx.utils.aesutils;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;


/**
 * 数据加密工具类
 */
public class EncryptionUtil {
    private static final String ALGORITHM = "AES";
    private static final String PADDING = "AES/ECB/PKCS5Padding";

    //加密密钥
    private static final String KEY = "N8MfABInvGh093KLuDsPO0YEtFWXNmU9";

    //加密
    public static String encryptData(Object data) throws Exception {
        String dataStr = String.valueOf(data);
        SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(PADDING);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);

        byte[] encryptedBytes = cipher.doFinal(dataStr.getBytes());
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    //解密
    public static String decryptData(Object data) throws Exception {
        String dataStr = String.valueOf(data);
        SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(PADDING);
        cipher.init(Cipher.DECRYPT_MODE, secretKey);

        byte[] encryptedBytes = Base64.getDecoder().decode(dataStr);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        return new String(decryptedBytes);
    }
}