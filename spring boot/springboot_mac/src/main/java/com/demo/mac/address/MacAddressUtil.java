package com.demo.mac.address;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.mac.mac
 * ClassName:    MacAddressUtil
 *
 * @Author chnpngwng
 * @Date 2023 06 03 19 08
 **/


public class MacAddressUtil {
    /**public static String getMacAddress() throws UnknownHostException, SocketException {
        // 1.获取本机IP地址
        InetAddress ipAddress = InetAddress.getLocalHost();
        //2.获取网络接口
        NetworkInterface networkInterface = NetworkInterface.getByInetAddress(ipAddress);
        //3.获取MAC地址
        byte[] macAddressBytes = networkInterface.getHardwareAddress();
        //4.格式化MAC地址
        StringBuilder macAddressBuilder = new StringBuilder();
        for (int i = 0; i < macAddressBytes.length; i++) {
            macAddressBuilder.append(String.format("%02X%s", macAddressBytes[i], (i < macAddressBytes.length - 1) ? "-" : ""));
        }
        String macAddress = macAddressBuilder.toString();
        return macAddress.toString();
    }*/

    public static String getMacAddress() throws UnknownHostException, SocketException {
        // 1.获取本机IP地址
        InetAddress ipAddress = InetAddress.getLocalHost();
        //2.获取网络接口列表
        Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
        //3.遍历网络接口列表获取MAC地址
        while (networkInterfaces.hasMoreElements()) {
            NetworkInterface networkInterface = networkInterfaces.nextElement();
            if (networkInterface.getInetAddresses().hasMoreElements()) {
                InetAddress inetAddress = networkInterface.getInetAddresses().nextElement();
                if (inetAddress.equals(ipAddress)) {
                    byte[] macAddressBytes = networkInterface.getHardwareAddress();
                    if (macAddressBytes != null && macAddressBytes.length > 0) {
                        StringBuilder macAddressBuilder = new StringBuilder();
                        for (int i = 0; i < macAddressBytes.length; i++) {
                            macAddressBuilder.append(String.format("%02X%s", macAddressBytes[i], (i < macAddressBytes.length - 1) ? "-" : ""));
                        }
                        String macAddress = macAddressBuilder.toString();
                        return macAddress;
                    }
                }
            }
        }
        return getMacAddress();
    }
}
