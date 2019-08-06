<%-- 
    Document   : msgSend
    Created on : Jul 21, 2019, 5:57:17 PM
    Author     : onemo
--%>
<%@page import="com.LiveChat.entities.Reciever"%>
<%@page import="com.LiveChat.entities.Message"%>
<%@page import="com.LiveChat.Dao.messageDao"%>
<%@page import="com.LiveChat.entities.User"%>

<%
    Reciever rec = (Reciever) session.getAttribute("current_reciever");
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String message = request.getParameter("msg");

    messageDao md = new messageDao();
    md.saveMessage(user.getUserId(), rec.getReciever(), message);
%>


