<%-- 
    Document   : mainMenu
    Created on : 7/11/2018, 04:26:44 AM
    Author     : C. Fernando Alfonso Caldera Olivas
--%>

<%@page import="nent.mem.user.UserDao"%>
<%@page import="nent.mem.user.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getSession().getAttribute("user") == null || request.getSession().getAttribute("pass") == null) {
        response.sendRedirect("loggedInError.jsp");
    } else {
        UserBean u = new UserBean();
        u.setUserName(request.getSession().getAttribute("user").toString());
        u.setPass(request.getSession().getAttribute("pass").toString());
        if (!UserDao.getInstance().recordExists(u)) {
            response.sendRedirect("loggedInNotValidUser.jsp");
        } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <title>Main Menu</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="offset-md-4 col-md-4">
                    <h1 class="h1">Main Menu</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <p><a href="memGame.jsp">Play new game.</a></p>
                    <p><a href="pastRecords.jsp">View past records.</a></p>
                </div>
            </div>
        </div>
    </body>
</html>
<%
        }
    }
%>
