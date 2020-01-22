<%-- 
    Document   : pastRecords
    Created on : 7/11/2018, 04:30:06 AM
    Author     : C. Fernando Alfonso Caldera Olivas
--%>

<%@page import="nent.mem.game.GameBean"%>
<%@page import="java.util.List"%>
<%@page import="nent.mem.game.GameDao"%>
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
            u = UserDao.getInstance().getRecord(u);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <title>Past game records</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="offset-md-4 col-md-4">
                    <h1 class="h1">Past Game Records</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped table-responsive-md table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>Date of the game</th>
                                <th>Time taken to solve</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                GameBean g = new GameBean();
                                g.setUser(u);
                                List<GameBean> games = GameDao.getInstance().getRecords(g);
                                if (games.size() == 0) {
                            %>
                            <tr>
                                <td colspan="2" style="text-align: center;">You haven't played a game yet.</td>
                            </tr>
                            <%
                            } else {
                                for (GameBean i : games) {
                            %>
                            <tr>
                                <td><%= i.getGameDate()%></td>
                                <td><%= i.getTimeToSolve()%></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <p><a href="mainMenu.jsp">Go back to main menu.</a></p>
                </div>
            </div>
        </div>
    </body>
</html>
<%        }
    }
%>