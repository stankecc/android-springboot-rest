package com.carservicetracker.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoder {
    public static String encode (String password) {
        String hashedPassword;
        try {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            hashedPassword = passwordEncoder.encode(password);
        } catch (Exception e) {
            e.printStackTrace();
            hashedPassword = null;
        }
        return hashedPassword;
    }
}
