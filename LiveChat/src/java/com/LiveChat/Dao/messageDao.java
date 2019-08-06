/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.LiveChat.Dao;

import com.LiveChat.connection.ConnectionProvider;
import com.LiveChat.entities.Message;
import static java.lang.System.out;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author onemo
 */
public class messageDao {

    //    Message insert starts
    public Message saveMessage(int sender, int reciever, String message) {

        java.sql.Connection con = ConnectionProvider.getConnection();
        Message msg = null;

        try {
            String saveQuery = "insert into messages(sender, reciever, message) values(?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(saveQuery);

            pstmt.setInt(1, sender);
            pstmt.setInt(2, reciever);
            pstmt.setString(3, message);

            pstmt.executeUpdate();

       
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
//    Message saving ends

    //    User read starts
    public List<Message> readMessage(int recieverId, int senderId) {
        List<Message> list = new ArrayList<>();

        java.sql.Connection con = ConnectionProvider.getConnection();

        try {
            String readQuery = "select * from messages where reciever=? and sender=? or sender=? and reciever=?";
            PreparedStatement pstmt = con.prepareStatement(readQuery);
            pstmt.setInt(1, recieverId);
            pstmt.setInt(2, senderId);
            pstmt.setInt(3, recieverId);
            pstmt.setInt(4, senderId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int msgId = rs.getInt("msgId");
                int reciever = rs.getInt("reciever");
                int sender = rs.getInt("sender");
                Timestamp msgTime = rs.getTimestamp("msgTime");
                String msgStatus = rs.getString("msgStatus");
                String message = rs.getString("message");

                Message msg = new Message(msgId, sender, reciever, msgTime, msgStatus, message);
                list.add(msg);
        
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

}
