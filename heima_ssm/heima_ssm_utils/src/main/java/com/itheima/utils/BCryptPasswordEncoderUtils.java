package com.itheima.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.UUID;

public class BCryptPasswordEncoderUtils {
    private static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
    public static String encodePassword(String password){
        return bCryptPasswordEncoder.encode(password);
    }


    public static void main(String[] args) {
        String password = "456";
        String pwd = encodePassword(password);//$2a$10$CJJ6OVQD62ouI5DmO/1wi.qlg6MZju7k.TChnriZTs05qXYvM03eK
        System.out.println(pwd);
        System.out.println(UUID.randomUUID().toString().replace("-", ""));
    }
}