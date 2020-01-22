<%-- 
    Document   : saveGame
    Created on : 7/11/2018, 05:59:25 PM
    Author     : C. Fernando Alfonso Caldera Olivas
--%>

<%@page import="nent.mem.game.GameDao"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="nent.mem.game.GameBean"%>
<%@page import="nent.mem.user.UserDao"%>
<%@page import="nent.mem.user.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            if (request.getSession().getAttribute("user") != null
                    && request.getSession().getAttribute("pass") != null) {
                UserBean u = new UserBean();
                u.setUserName(request.getSession().getAttribute("user").toString());
                u.setPass(request.getSession().getAttribute("pass").toString());
                if (UserDao.getInstance().recordExists(u)) {
                    if (request.getParameter("timePlayed") != null) {
                        u = UserDao.getInstance().getRecord(u);
                        GameBean g = new GameBean();
                        g.setGameDate(new Timestamp(System.currentTimeMillis()));
                        Object a = request.getParameter("timePlayed");
                        g.setTimeToSolve(new BigDecimal(request.getParameter("timePlayed").toString()));
                        g.setUser(u);
                        GameDao.getInstance().save(g);
                        response.sendRedirect("pastRecords.jsp");
                    } else {
                        response.sendRedirect("saveGameError.jsp");
                    }
                } else {
                    response.sendRedirect("loggedInNotValidUser.jsp");
                }
            } else {
                response.sendRedirect("loggedInError.jsp");
            }
        %>
    </body>
</html>
