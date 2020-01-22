<%-- 
    Document   : login
    Created on : 6/11/2018, 04:52:47 AM
    Author     : facoj
--%>

<%@page import="nent.mem.user.UserDao"%>
<%@page import="nent.mem.user.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <title>Login</title>
    </head>
    <body>
        <%
            if (request.getSession().getAttribute("user") != null && request.getSession().getAttribute("pass") != null) {
                UserBean u = new UserBean();
                u.setUserName(request.getSession().getAttribute("user").toString());
                u.setPass(request.getSession().getAttribute("pass").toString());
                if(UserDao.getInstance().recordExists(u)){
                    response.sendRedirect("mainMenu.jsp");
                }else{
                    response.sendRedirect("loggedInNotValidUser.jsp");
                }
            } else {
        %>
        <div class="container-fluid">
            <div class="row offset-md-4 col-md-4">
                <h1 class="h1">Login</h1>
            </div>
            <form method="post" action="loggedIn.jsp">
                <div class="form-group">
                    <div class="form-row">
                        <label for="user" class="offset-md-4 col-md-4">
                            <span>Username:</span>
                            <input type="text" id="user" name="user" maxlength="25" class="form-control">
                        </label>
                    </div>
                    <div class="form-row">
                        <label for="pass" class="offset-md-4 col-md-4">
                            <span>Password:</span>
                            <input type="password" id="pass" name="pass" class="form-control">
                        </label>
                    </div>
                    <div class="form-row">
                        <button type="submit" class="btn offset-md-4 col-md-4">Login</button>
                    </div>
                </div>
            </form>
            <div class="row">
                <p class="offset-md-4 col-md-4"><small>Don't have an account? <a href="signUpForm.jsp">Click here!</a></small></p>
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>
