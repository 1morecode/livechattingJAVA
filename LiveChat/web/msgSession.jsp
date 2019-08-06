<%-- 
    Document   : msgSession
    Created on : Jul 25, 2019, 7:09:32 PM
    Author     : onemo
--%>

<%@page import="com.LiveChat.entities.Reciever"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int reciever = Integer.parseInt(request.getParameter("reciever"));
    Reciever rec = new Reciever(reciever);
    session.setAttribute("current_reciever", rec);
%>