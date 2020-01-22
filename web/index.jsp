<%-- 
    Document   : index
    Created on : 6/11/2018, 04:53:10 AM
    Author     : facoj
--%>

<%@page import="nent.mem.user.UserDao"%>
<%@page import="nent.mem.user.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <%
            if(request.getSession().getAttribute("user") != null &&
                    request.getSession().getAttribute("pass") != null){
                UserBean u = new UserBean();
                u.setUserName(request.getSession().getAttribute("user").toString());
                u.setPass(request.getSession().getAttribute("pass").toString());
                if(UserDao.getInstance().recordExists(u)){
                    response.sendRedirect("mainMenu.jsp");
                }else{
                    response.sendRedirect("loggedInNotValidUser.jsp");
                }
            }else{
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
