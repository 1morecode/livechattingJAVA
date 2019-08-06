<%-- 
    Document   : index.jsp
    Created on : Jul 21, 2019, 12:44:22 AM
    Author     : onemo
--%>

<%@page import="com.LiveChat.entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user != null) {
        response.sendRedirect("home.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Live Chat</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.5/css/mdb.min.css" rel="stylesheet">
    </head>
    <body style="background-image: url('images/bgForm.png'); background-size: cover; background-repeat: no-repeat;">
        <div class="container-fluid">

            <div class="row  justify-content-center" style="background-image: url('images/bgForm.png'); background-size: cover; background-repeat: no-repeat;">
                <div class="col-12 text-center text-light"><h2 class="mt-3"><strong>LIVE CHAT</strong></h2></div>
                <div class="col-12 text-center text-light"><p class="mt-1"><strong>Chat with your friends online</strong></p></div>
            </div>

            <!--Navbar-->

            <div class="row bg-info">
                <div class="col-md-6 p-3 text-right" >
                    <ul class="navbar-nav ml-auto pr-5" style="border-right: 2px solid tomato;">
                        <li class="nav-item" onclick="loginShow()">
                            <a class="nav-link text-dark" href="#"><strong>SIGN IN</strong></a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-6 p-3  text-left">
                    <ul class="navbar-nav mr-auto pl-3">
                        <li class="nav-item" onclick="registerShow()">
                            <a class="nav-link text-dark" href="#"><strong>REGISTER</strong></a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4 mt-5">

                    <form class="text-center border border-light p-5 bg-dark text-light" action="login.jsp" method="POST" id="loginForm">

                        <p class="h4 mb-4">Sign in</p>

                        <input type="email" class="form-control mb-4" name="userEmail" placeholder="E-mail">
                        <input type="password" class="form-control mb-4" name="userPass" placeholder="Password">

                        <button class="btn btn-info btn-block my-4" type="submit">Sign in</button>

                    </form>
                    
                    <form class="text-center border border-light p-5 bg-dark text-light" action="register.jsp" method="POST" id="registerForm" style="display: none;">

                        <p class="h4 mb-4">Register</p>

                        <input type="text" class="form-control mb-4" name="userName" placeholder="Name">
                        <input type="email" class="form-control mb-4" name="userEmail" placeholder="E-mail">
                        <input type="password" class="form-control mb-4" name="userPass" placeholder="Password">

                        <button class="btn btn-success btn-block my-4" type="submit">Register</button>

                    </form>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4 mt-5">
                    
                </div>
            </div>

        </div>

        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.5/js/mdb.min.js"></script>
        
        <script>
            function loginShow(){
                $("#loginForm").show();
                $("#registerForm").hide();
            }
            function registerShow(){
                $("#loginForm").hide();
                $("#registerForm").show();
            }
        </script>

    </body>
</html>
