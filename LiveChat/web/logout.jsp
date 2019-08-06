<%-- 
    Document   : logout
    Created on : Jul 21, 2019, 2:25:07 AM
    Author     : onemo
--%>


<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
