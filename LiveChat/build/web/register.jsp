<%-- 
    Document   : register
    Created on : Jul 21, 2019, 1:47:27 AM
    Author     : onemo
--%>

<%@page import="com.LiveChat.entities.User"%>
<%@page import="com.LiveChat.Dao.userDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userName = request.getParameter("userName");
    String userEmail = request.getParameter("userEmail");
    String userPass = request.getParameter("userPass");
    
     try {

        userDao user = new userDao();
        
       user.saveUser(userName, userEmail, userPass);
       
      User u = user.readUser(userEmail, userPass);

        if (u != null) {
            session.setAttribute("current_user", u);
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
