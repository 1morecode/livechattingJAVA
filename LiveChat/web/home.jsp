<%-- 
    Document   : home
    Created on : Jul 21, 2019, 1:50:52 AM
    Author     : onemo
--%>

<%@page import="com.LiveChat.entities.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.LiveChat.Dao.userDao"%>
<%@page import="com.LiveChat.entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class=''>
    <head>
        <link rel="canonical" href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
        <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>
        <script src="https://use.typekit.net/hoy3lrg.js"></script>
        <script>try {
                Typekit.load({async: true});
            } catch (e) {
            }</script>
        <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
        <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
        <link rel="stylesheet" href="css/style.css"/>

    </head>
    <body>

        <div id="frame">
            <!--SidePannel Starts-->
            <div id="sidepanel">
                <div id="profile">
                    <div class="wrap">
                        <img id="profile-img" src="images/users/<%= user.getUserImg()%>" class="online" alt="" />
                        <p><%= user.getUserName()%></p>

                        <i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>

                    </div>
                </div>
                <div id="search">
                    <label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
                    <input type="text" placeholder="Search contacts..." />
                </div>
                <div id="contacts">
                    <ul>
                        <%
                            userDao u = new userDao();
                            List<User> list = u.readAllUser();

                            for (User us : list) {
                                if(user.getUserId() != us.getUserId()){
                        %>
                        <li class="contact" onclick="msgSession(<%= us.getUserId()%>); msgHeader(); msgForm()" style="border-bottom: 1px solid whitesmoke">
                            <div class="wrap">
                                <span class="contact-status online"></span>
                                <img src="images/users/<%= us.getUserImg()%>" alt="" />
                                <div class="meta">
                                    <p class="name"><%= us.getUserName()%></p>
                                    <p class="preview"><%= us.getUserEmail()%></p>
                                </div>
                            </div>
                        </li>

                        <%
                            }
                            }
                        %>
                    </ul>
                </div>
                <div id="bottom-bar">
                    <button id="addcontact"><i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>Add contact</span></button>
                    <a href="logout.jsp"><button id="settings"><i class="fa fa-user" aria-hidden="true"></i> <span>Logout</span></button></a>
                </div>
            </div>
            <!--Side Panel ends-->

            <div class="content">
                <span id="msgHeader">
                    <!--Msg Header-->
                </span>
                <div class="messages">
                    <ul id="msgOutput">
                        <!--Chat Box here-->
                    </ul>
                </div>
                <div class="message-input">
                    <div class="wrap" id="msgForm">
                        <!--Msg Form-->
                    </div>
                </div>
            </div>
        </div>
        <div id="msgSend"></div>
        <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>

        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.5/js/mdb.min.js"></script>


        <!--Ajax request script starts-->
        <script>

                            var request;
                            function msgSession(reciever) {
                                
                                $.ajax({
                                    url: "msgSession.jsp?reciever=" + reciever,
                                    success: function (data, textStatus, jqXHR) {

                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        console.log(data);
                                    }
                                });
                            }
        </script>
        <!--Ajax request script ends-->   

        <!--Ajax request script starts-->
        <script>

            var request;
            function msgHeader() {
                $.ajax({
                    url: "msgBoxHeader.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $("#msgHeader").html(data);
                        setInterval(function () {
                            $.ajax({
                                url: "msgBox.jsp",
                                success: function (data, textStatus, jqXHR) {
                                    $("#msgOutput").html(data);
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.log(data);
                                }
                            });
                        }, 2000);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                    }
                });
            }


        </script>
        <!--Ajax request script ends-->   


        <!--Ajax request script starts-->
        <script>
            var request;
            function msgForm() {
                $.ajax({
                    url: "msgForm.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $("#msgForm").html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                    }
                });
            }
        </script>
        <!--Ajax request script ends-->   

        <!--Ajax request script starts-->
        <script>
            var request;
            function msgSend() {
                $.ajax({
                    type: 'POST',
                    url: 'msgSend.jsp',
                    data: {
                        msg: $('#msg').val()
                    },
                    success: function (data, textStatus, jqXHR) {
                        $.ajax({
                            url: "msgForm.jsp",
                            success: function (data, textStatus, jqXHR) {
                                $("#msgForm").html(data);
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(data);
                            }
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                    }
                });
            }
        </script>
        <!--Ajax request script ends-->   


    </body>
</html>
