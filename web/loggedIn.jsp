<%-- 
    Document   : loggedIn
    Created on : 6/11/2018, 05:33:16 AM
    Author     : facoj
--%>

<%@page import="nent.utils.Encrypter"%>
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
            if (request.getParameter("user") != null
                    && request.getParameter("pass") != null) {
                UserBean u = new UserBean();
                u.setUserName(request.getParameter("user").toString());
                u.setPass(Encrypter.encrypt(request.getParameter("pass").toString()));
                if (UserDao.getInstance().recordExists(u)) {
                    request.getSession().setAttribute("user", u.getUserName());
                    request.getSession().setAttribute("pass", u.getPass());
                    response.sendRedirect("mainMenu.jsp");
                } else {
                    response.sendRedirect("loggedInNotValidUser.jsp");
                }
            } else {
                response.sendRedirect("loggedInError.jsp");
            }
        %>
    </body>
</html>
