<%-- 
    Document   : signUp
    Created on : 6/11/2018, 10:03:10 AM
    Author     : C. Fernando Alfonso Caldera Olivas
--%>

<%@page import="nent.mem.user.UserBean"%>
<%@page import="nent.mem.user.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            UserBean u = new UserBean();
            u.setUserName(request.getParameter("user").toString());
            u.setPass(request.getParameter("pass").toString());
            if(UserDao.getInstance().save(u) != 0){
                response.sendRedirect("signUpSuccess.jsp");
            }else{
                response.sendRedirect("signUpError.jsp");
            }
        %>
    </body>
</html>
