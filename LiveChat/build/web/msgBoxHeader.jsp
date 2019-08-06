<%-- 
    Document   : msg-Box-Header
    Created on : Jul 22, 2019, 9:51:13 PM
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

<%

    userDao re = new userDao();
    User r = re.readReciever(rec.getReciever());
%>

<%@page import="com.LiveChat.entities.User"%>
<%@page import="com.LiveChat.Dao.userDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <div class="contact-profile">
            <img src="images/users/<%=r.getUserImg()%> " alt="" />
            <p><%= r.getUserName()%></p>
            <div class="social-media">
                <i class="fa fa-facebook" aria-hidden="true"></i>
                <i class="fa fa-twitter" aria-hidden="true"></i>
                <i class="fa fa-instagram" aria-hidden="true"></i>
            </div>
        </div>
