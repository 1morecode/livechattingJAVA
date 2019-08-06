<%-- 
    Document   : login
    Created on : Jul 21, 2019, 1:47:12 AM
    Author     : onemo
--%>

<%@page import="com.LiveChat.Dao.userDao"%>
<%@page import="com.LiveChat.entities.User"%>
<%@page import="com.LiveChat.connection.ConnectionProvider"%>
<%@page import="java.beans.Statement, java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String uEmail = request.getParameter("userEmail");
    String uPass = request.getParameter("userPass");
    
    try {

        userDao user = new userDao();
        User u = user.readUser(uEmail, uPass);

        if (u != null) {
            session.setAttribute("current_user", u);
            response.sendRedirect("home.jsp");
        } else {
            %>
            <script>
                alert("Email or Password is incorrect !");
            </script>
            <%
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
