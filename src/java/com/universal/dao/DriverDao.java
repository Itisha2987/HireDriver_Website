/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.universal.dao;

import com.universal.db.DBConnection;
import com.universal.dto.Driver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author lenov0
 */
public class DriverDao {

    public static void addDriver(Driver driver) {
        Connection conn=DBConnection.getConnection();
        String sql="INSERT INTO driver(name,username,password,email,phone,city,gender,age,lisence_number,profile_photo,hash,activation_status,OTP) VALUES('"+driver.getName()+"','"+driver.getUsername()+"','"+driver.getPassword()+"','"+driver.getEmail()+"','"+driver.getPhone()+"','"+driver.getCity()+"','"+driver.getGender()+"','"+driver.getAge()+"','"+driver.getLisence()+"','"+driver.getProfile()+"','"+driver.getHash()+"',0,'')";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            System.out.println(ps);
            ps.execute();
        } catch (Exception ex) {
           ex.printStackTrace();
        }
    }
    
     public static void addDutyRecord(Driver driver) {
        Connection conn=DBConnection.getConnection();
        String sql;
        sql = "INSERT INTO dutyinfo(name,cityfrom,cityto,amount,departuredate,departuretime,fare,returndate,returntime,id,passengername) VALUES('"+driver.getName()+"','"+driver.getCityFrom()+"','"+driver.getCityTo()+"','"+driver.getAmount()+"','"+driver.getDeparturedate()+"','"+driver.getDeparturetime()+"','"+driver.getFare()+"','"+driver.getReturndate()+"','"+driver.getReturntime()+"','"+driver.getId()+"','"+driver.getPassengername()+"')";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            System.out.println(ps);
            ps.execute();
        } catch (Exception ex) {
           ex.printStackTrace();
        }
    }
    
public static ArrayList<Driver> getDriverInfo(){
    Connection conn = DBConnection.getConnection();
 ArrayList<Driver> driverList=new ArrayList<>();
        try {
            String sql = "select * from driver";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                int id= rs.getInt("id");
                String name = rs.getString("name");
                String city = rs.getString("city");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                int age= rs.getInt("age");
                String lisence=rs.getString("lisence_number");
                String photo=rs.getString("profile_photo");
                Driver driver =new Driver();
                driver.setId(id);
                driver.setCity(city);
                driver.setEmail(email);
                driver.setAge(age);
                driver.setGender(gender);
                driver.setName(name);
                driver.setPhone(phone);
                driver.setLisence(lisence);
                driver.setProfile(photo);
                 
                driverList.add(driver);
                System.out.println(driverList);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return driverList;
    }

public static Driver getDriverById(int Id){
Connection conn = DBConnection.getConnection();
  Driver driver =new Driver();
        try {
            String sql = "select * from driver where id='"+Id+"'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                int id= rs.getInt("id");
                String name = rs.getString("name");
                String city = rs.getString("city");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                int age= rs.getInt("age");
                String lisence=rs.getString("lisence_number");
                String photo=rs.getString("profile_photo");
               
                driver.setId(id);
                driver.setCity(city);
                driver.setEmail(email);
                driver.setAge(age);
                driver.setGender(gender);
                driver.setName(name);
                driver.setPhone(phone);
                driver.setLisence(lisence);
                driver.setProfile(photo);
                
                System.out.println(driver);
     
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return driver;
}

    public static boolean deleteDriverById(int id){
    Connection conn=DBConnection.getConnection();
    boolean flag=false;
    try{
    String sql="delete from driver where id='"+id+"'";
   PreparedStatement ps = conn.prepareStatement(sql);
       flag= ps.execute();
        }
    catch(Exception e){
    e.printStackTrace();
    }
return flag;
    }

    public static boolean updateRecord(Driver driver) {
        
     boolean flag=false;
        Connection conn=DBConnection.getConnection();
        try{
            System.out.println(driver);
      int age = driver.getAge();
        String city = driver.getCity();
        String phone = driver.getPhone();
        String email = driver.getEmail();
        String gender = driver.getGender();
        String name = driver.getName();
        String username = driver.getUsername();
        int id=driver.getId();
        String lisence=driver.getLisence();
        int activate=driver.getActivation_status();
        String sql="update driver set name='"+name+"',email='"+email+"', phone='"+phone+"', city='"+city+"', gender='"+gender+"', age='"+age+"', lisence_number='"+lisence+"', activation_status='"+activate+"' where id="+id;
            PreparedStatement ps = conn.prepareStatement(sql);
       flag= ps.execute();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }

  public static ArrayList getDutyInfoById(int Id){
Connection conn = DBConnection.getConnection();
 ArrayList driverlist =new ArrayList();
        try {
            String sql = "select * from driver where id='"+Id+"'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            Driver driver=new Driver();
            while (rs.next()) {
                
                int id= rs.getInt("id");
                String name = rs.getString("name");
                String city = rs.getString("city");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                int age= rs.getInt("age");
                String lisence=rs.getString("lisence_number");
                String photo=rs.getString("profile_photo");
               
                driver.setId(id);
                driver.setCity(city);
                driver.setEmail(email);
                driver.setAge(age);
                driver.setGender(gender);
                driver.setName(name);
                driver.setPhone(phone);
                driver.setLisence(lisence);
                driver.setProfile(photo);
                
              driverlist.add(driver);
     
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return driverlist;
}

}
    

