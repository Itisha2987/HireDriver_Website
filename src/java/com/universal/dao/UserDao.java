/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.universal.dao;

import com.universal.db.DBConnection;
import com.universal.dto.Driver;
import com.universal.dto.User;
import com.universal.otp.CommonToolClass;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenov0
 */
public class UserDao {

    public static void addRecord(User user){
            Connection conn=DBConnection.getConnection();
            String sql="INSERT INTO user(name,username,password,email,phone,hash,activation_status,otp) VALUES('"+user.getName()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+user.getEmail()+"','"+user.getPhone()+"','"+user.getHash()+"',0,'')";
        try {
                PreparedStatement ps = conn.prepareStatement(sql);
                System.out.println(ps);
                ps.execute();
        } catch (Exception ex) {
             ex.printStackTrace();
        }
    }

   
      public static boolean isExist(String username,String password){
    boolean flag=false;
 try{
           Connection conn = DBConnection.getConnection();
            Statement st = conn.createStatement();
            String sql="select * from user";
            ResultSet rs = st.executeQuery(sql);
            int i = 0;
            while(rs.next()){
            String uname = rs.getString(3);
            String pword= rs.getString(4);
            if(username.equals(uname)&& password.equals(pword)){
             flag=true;
              }
            }
          
       }
        catch(Exception e){
            e.printStackTrace();
                } 
 return flag;
    }
      
       public static void getphone(String username) {
       
     try{
             System.out.println(username);
        Connection conn = DBConnection.getConnection();
        String sql="select * from user where name='"+username+"'";
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql);
                       while(rs.next()){
                           String name=rs.getString(2);
              String  phone = rs.getString(6);
                           System.out.println(name);
                           System.out.println(phone);
                              CommonToolClass.SendAndSavaeOtp(name, phone);
             }
                       }catch(Exception e){
                       e.printStackTrace();
                       }
    }


     public static void updateOtp(String otp,String username) {
         try{
             
        Connection conn = DBConnection.getConnection();
        String sql="update user set otp='"+otp+"' where name='"+username+"'";
              PreparedStatement ps = conn.prepareStatement(sql);
          ps.execute();
          }
          catch(Exception e){
              e.printStackTrace();
          }

    }
     
     public static int updatePword(String otp,String newpword)
    {   int flag=0; 
        Connection conn=DBConnection.getConnection();
    
        try{
        String sql="select otp from user where otp='"+otp+"'";
            PreparedStatement ps = conn.prepareStatement(sql);
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
            String sql1="update user set password='"+newpword+"' where otp='"+otp+"'";
             PreparedStatement ps1 = conn.prepareStatement(sql1);
            int i=ps1.executeUpdate();
            if(i==1){
                     flag= 1;
                  }
          }
            else{
flag= 0;            }
        }catch(Exception e){
        e.printStackTrace();
        }


   return flag;

    }
     
   public static User getUserById(int Id){
Connection conn = DBConnection.getConnection();
  User user =new User();
        try {
            String sql = "select * from user where user_id='"+Id+"'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                int id= rs.getInt("user_id");
                String name = rs.getString("name");
              String username=rs.getString("username");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
               
                user.setId(id);
                user.setEmail(email);
                user.setName(name);
                user.setPhone(phone);
               user.setUsername(username);
                System.out.println(user);
     
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
}

    public static boolean deleteUserById(int id){
    Connection conn=DBConnection.getConnection();
    boolean flag=false;
    try{
    String sql="delete from user where user_id='"+id+"'";
   PreparedStatement ps = conn.prepareStatement(sql);
       flag= ps.execute();
        }
    catch(Exception e){
    e.printStackTrace();
    }
return flag;
    }
    
    public static ArrayList<User> getUserInfo(){
    Connection conn = DBConnection.getConnection();
 ArrayList<User> userList=new ArrayList<>();
        try {
            String sql = "select * from user";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                int id= rs.getInt("user_id");
                String name = rs.getString("name");
                String username=rs.getString("username");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                
                User user =new User();
                user.setId(id);
                user.setEmail(email);
                user.setName(name);
                user.setPhone(phone);
                user.setUsername(username);
               userList.add(user);
                System.out.println(userList);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }

   public static boolean updateRecord(User user) {
        
     boolean flag=false;
        Connection conn=DBConnection.getConnection();
        try{
        int id=user.getId();
        String phone = user.getPhone();
        String email = user.getEmail();
        String name = user.getName();
        String username = user.getUsername();
         int activate=user.getActivate();
         
        String sql="update user set name='"+name+"',username='"+username+"', email='"+email+"',phone='"+phone+"',activation_status='"+activate+"' where user_id="+id;
            PreparedStatement ps = conn.prepareStatement(sql);
       flag= ps.execute();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    public static boolean isActive(String username, String pass) {
   boolean flag=false;
 try{
           Connection conn = DBConnection.getConnection();
            Statement st = conn.createStatement();
            String sql="select * from user where username='"+username+"' and password='"+pass+"'";
            ResultSet rs = st.executeQuery(sql);
            int i = 0;
            while(rs.next()){
          int active=rs.getInt(8);
            if(active==1){
             flag=true;
            }
            }
          
       }
        catch(Exception e){
            e.printStackTrace();
                } 
 return flag;
    }
    
    public static ArrayList<User> getFeedbackList(){
    Connection conn = DBConnection.getConnection();
 ArrayList<User> userList=new ArrayList<>();
        try {
            String sql = "select * from feedback";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                
                String name = rs.getString("name");
                String feedback=rs.getString("feedback");
                String image=rs.getString("photo");
                
                User user =new User();
                user.setName(name);
                user.setFeedback(feedback);
                user.setImage(image);
               userList.add(user);
                System.out.println(userList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }
    
    
     public static void addFeedback(User user){
            Connection conn=DBConnection.getConnection();
            try{
            String sql="INSERT INTO feedback(name,feedback,photo) VALUES('"+user.getName()+"','"+user.getFeedback()+"','"+user.getImage()+"')";
      
                PreparedStatement ps = conn.prepareStatement(sql);
                System.out.println(ps);
                ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addjourneyrecord(User user) {
  Connection conn=DBConnection.getConnection();
            String sql="INSERT INTO journeyinfo(name,cityfrom,cityto,amount,email,phone,username) VALUES('"+user.getName()+"','"+user.getCityfrom()+"','"+user.getCityto()+"','"+user.getAmount()+"','"+user.getEmail()+"','"+user.getPhone()+"','"+user.getUsername()+"')";
        try {
                PreparedStatement ps = conn.prepareStatement(sql);
                System.out.println(ps);
                ps.execute();
        } catch (Exception ex) {
             ex.printStackTrace();
        }    }


public static int generateamount(String cityfrom, String cityto) {
             int cost=0;
        if(cityfrom.equals("indore")||cityto.equals("bhopal"))
        {
            cost=195*6;
        }
        if(cityfrom.equals("indore")||cityto.equals("pune"))
        {
            cost=593*6;
        }
        if(cityfrom.equals("pune")||cityto.equals("bhopal"))
        {
            cost=785*6;
        }
        if(cityfrom.equals("pune")||cityto.equals("indore"))
        {
            cost=593*6;
        }
        if(cityfrom.equals("bhopal")||cityto.equals("indore"))
        {
            cost=195*6;
        }
        if(cityfrom.equals("bhopal")||cityto.equals("pune"))
        {
            cost=785*6;
        }
        return cost;
    }

  public static User getJourneyInfo(String uname){
    Connection conn = DBConnection.getConnection();
   
                User user =new User();
        try {
            String sql = "select * from journeyinfo where username='"+uname+"'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
               
                String name = rs.getString("name");
                String username=rs.getString("username");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                int amount=rs.getInt("amount");
              
                user.setEmail(email);
                user.setName(name);
                user.setPhone(phone);
                user.setUsername(username);
                user.setAmount(amount);
                System.out.println(user);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

}
    

