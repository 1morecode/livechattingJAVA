/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.LiveChat.Dao;

import com.LiveChat.connection.ConnectionProvider;
import com.LiveChat.entities.User;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author onemo
 */
public class userDao {

    public User saveUser(String userName, String userEmail, String userPass) {

        java.sql.Connection con = ConnectionProvider.getConnection();
        User user = null;

        try {

            String saveQuery = "insert into users(userName,  userEmail, userPass) values(?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(saveQuery);

            pstmt.setString(1, userName);
            pstmt.setString(2, userEmail);
            pstmt.setString(3, userPass);

            pstmt.executeUpdate();

            out.println("User saved in DB!");
     

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }

    //    User read starts
    public User readUser(String uEmail, String uPass) {

        java.sql.Connection con = ConnectionProvider.getConnection();
        User user = null;

        try {
            String readQuery = "select * from users where userEmail=? and userPass=?";
            PreparedStatement pstmt = con.prepareStatement(readQuery);
            pstmt.setString(1, uEmail);
            pstmt.setString(2, uPass);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("userId");
                String userName = rs.getString("userName");
                String userEmail = rs.getString("userEmail");
                String userPass = rs.getString("userPass");
                String userImg = rs.getString("userImg");
                Timestamp userRegDate = rs.getTimestamp("userRegDate");

                user = new User(userId, userName, userEmail, userPass, userImg, userRegDate, true);
                user.setValid(true);
                System.out.println("User was readed! User Id = " + userId);
                con.close();
            } else {
                out.println("User not present in DB");
                user.setValid(false);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }

    // Reciever read starts
    public User readReciever(int recieverId) {

        java.sql.Connection con = ConnectionProvider.getConnection();
        User reciever = null;

        try {
            String readQuery = "select * from users where userId=?";
            PreparedStatement pstmt = con.prepareStatement(readQuery);
            pstmt.setInt(1, recieverId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("userId");
                String userName = rs.getString("userName");
                String userEmail = rs.getString("userEmail");
                String userPass = rs.getString("userPass");
                String userImg = rs.getString("userImg");
                Timestamp userRegDate = rs.getTimestamp("userRegDate");

                reciever = new User(userId, userName, userEmail, userPass, userImg, userRegDate, true);
                reciever.setValid(true);
         

            } else {
                out.println("User not present in DB");
                reciever.setValid(false);
        
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reciever;

    }
//    Reciever reading ends

    //  All  User read starts
    public List<User> readAllUser() {

        java.sql.Connection con = ConnectionProvider.getConnection();
        List<User> list = new ArrayList<>();

        try {
            Statement stmt = con.createStatement();
            String readQuery = "select * from users ORDER by userId";

            ResultSet rs = stmt.executeQuery(readQuery);

            while (rs.next()) {
                int userId = rs.getInt("userId");
                String userName = rs.getString("userName");
                String userEmail = rs.getString("userEmail");
                String userPass = rs.getString("userPass");
                String userImg = rs.getString("userImg");
                Timestamp userRegDate = rs.getTimestamp("userRegDate");

                User user = new User(userId, userName, userEmail, userPass, userImg, userRegDate, true);
                list.add(user);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
        
    }

}
