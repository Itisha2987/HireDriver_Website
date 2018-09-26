package com.universal.otp;


import com.universal.dao.UserDao;
import java.net.*;
import java.io.*;
import java.util.Random;

public class CommonToolClass {

    static public void SendAndSavaeOtp(String username,String phone) {
        try {
             String otp=getOtp();
             UserDao.updateOtp(otp,username);
            String data = "";
            
            data += "username=" + URLEncoder.encode("javademo", "ISO-8859-1");
            data += "&password=" + URLEncoder.encode("javademo", "ISO-8859-1");
            data += "&message=" + URLEncoder.encode("Hi "+username+"\n"+ " Your one time password is \n"+otp, "ISO-8859-1");
            data += "&want_report=1";
            data += "&msisdn=91"+phone;
            URL url = new URL("https://bulksms.vsms.net/eapi/submission/send_sms/2/2.0");

            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
            wr.write(data);
            wr.flush();
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = rd.readLine()) != null) {
                // Print the response output...
                System.out.println(line);
            }
            wr.close();
            rd.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   
     static public String getOtp() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 6) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String otp = salt.toString();
        return otp;

    }
}