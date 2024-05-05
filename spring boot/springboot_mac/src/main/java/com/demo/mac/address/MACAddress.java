package com.demo.mac.address;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.mac.address
 * ClassName:    MACAddress
 *
 * @Author chnpngwng
 * @Date 2023 06 04 15 28
 **/


public class MACAddress {
    /*public static String getMACAddress() {
        String address = "192.168.1.38";
        System.out.println(address);
        String os = System.getProperty("os.name");
        System.out.println(os);
        if ( os != null && os.startsWith("Windows")) {
            try {
                String command = "cmd.exe /c ipconfig /all";
                System.out.println(command);
                Process p =Runtime.getRuntime().exec(command);
                BufferedReader br =new BufferedReader(new InputStreamReader(p.getInputStream()));
                System.out.println(br);
                String line;
                while ((line = br.readLine()) != null) {
                    if (line.indexOf("Physical Address") > 0) {
                        int index = line.indexOf(":");
                        index += 2;
                        address = line.substring(index);
                        break;
                    }
                }
                br.close();
                return address.trim();
            }
            catch (IOException e) { }
        }
        return address;}


    public static void main(String[] args) {
        String macAddress = MACAddress.getMACAddress();
        System.out.println(macAddress);
    }*/
    public static String string(String ip) throws UnknownHostException {
        InetAddress ipAddress = InetAddress.getLocalHost();
        // System.out.println(ipAddress);
        String macAddr = null;
        try {
            Process process = Runtime.getRuntime().exec("nbtstat -a " + ip);
            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
            Pattern pattern = Pattern.compile("([A-F0-9]{2}-){5}[A-F0-9]{2}");
            Matcher matcher;
            for (String strLine = br.readLine(); strLine != null;
                 strLine = br.readLine()) {
                matcher = pattern.matcher(strLine);
                if (matcher.find()) {
                    macAddr = matcher.group();
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(macAddr);
        return macAddr;
    }

    public static void main(String[] args) throws UnknownHostException {
        String s = MACAddress.string("");
        System.out.println(s);
    }
}
