<%-- 
    Document   : signup
    Created on : 6/11/2018, 09:09:13 AM
    Author     : C. Fernando Alfonso Caldera Olivas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <title>Sign Up</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="h1">Sign Up</h1>
                </div>
            </div>
            <form method="post" action="signUp.jsp">
                <div class="form-group">
                    <fieldset>
                        <legend>User Registration</legend>
                        <div class="form-row">
                            <label for="user" class="col-md-4">
                                <span>Username:</span>
                                <input type="text" id="user" name="user" class="form-control">
                            </label>
                        </div>
                        <div class="form-row">
                            <label class="col-md-4">
                                <span>Password:</span>
                                <input type="password" id="pass" name="pass" class="form-control">
                            </label>
                        </div>
                        <div class="form-row">
                            <button type="submit" class="btn">Sign Up</button>
                        </div>
                    </fieldset>
                </div>
            </form>
        </div>
    </body>
</html>
