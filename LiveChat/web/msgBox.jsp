<%-- 
    Document   : msgBox
    Created on : Jul 21, 2019, 12:46:10 PM
    Author     : onemo
--%>
<%@page import="com.LiveChat.entities.Reciever"%>
<%@page import="com.LiveChat.connection.ConnectionProvider"%>
<%
    Reciever rec = (Reciever) session.getAttribute("current_reciever");
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="java.util.List, java.sql.*"%>
<%@page import="com.LiveChat.entities.Message"%>
<%@page import="com.LiveChat.Dao.messageDao"%>
<%@page import="com.LiveChat.entities.User"%>
<%@page import="com.LiveChat.Dao.userDao"%>
<%

    userDao re = new userDao();
    User r = re.readReciever(rec.getReciever());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            messageDao md = new messageDao();
            List<Message> list = md.readMessage(rec.getReciever(), user.getUserId());

            for (Message msg : list) {
                if (msg.getSender() == user.getUserId()) {
        %>

    <li class="replies">
        <img src="images/users/<%=user.getUserImg()%>" alt="" />
        <p><%= msg.getMessage()%></p>
    </li>
    <%
    } else {
    %>
    <li class="sent">
        <img src="images/users/<%= r.getUserImg()%>" alt="" />
        <p><%= msg.getMessage()%></p>
    </li>
    <%
            }
        }
    %>

</body>
</html>
