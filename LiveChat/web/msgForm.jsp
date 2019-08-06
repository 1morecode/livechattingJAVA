<%-- 
    Document   : msgForm
    Created on : Jul 22, 2019, 10:31:38 PM
    Author     : onemo
--%>

<%@page import="com.LiveChat.entities.Reciever"%>
<%
    Reciever rec = (Reciever) session.getAttribute("current_reciever");
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>

<%@page import="com.LiveChat.entities.User"%>
<%@page import="com.LiveChat.Dao.userDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <form id="msgSendForm" name="msgSendForm" method="post" onsubmit="return false;">
            <input type="text" name="msg" id="msg" placeholder="Type a message..." />
            <i class="fa fa-paperclip attachment" aria-hidden="true"></i>
            <button class="submit" id="msgSendButton" onclick="msgSend()"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
        </form>
