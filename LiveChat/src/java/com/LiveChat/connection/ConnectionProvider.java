/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.LiveChat.connection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author onemo
 */
import java.sql.*;

public class ConnectionProvider {

    public static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        
            con = DriverManager.getConnection("jdbc:mysql://localhost:3360/livechat", "root", "root");
          
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
