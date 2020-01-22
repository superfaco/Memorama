<%-- 
    Document   : memGame
    Created on : 6/11/2018, 06:06:56 AM
    Author     : facoj
--%>

<%@page import="nent.mem.user.UserDao"%>
<%@page import="nent.mem.user.UserBean"%>
<%@page import="java.util.Random"%>
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
        <title>Memory Game</title>
        <script type="text/javascript">
            var cardsImages = new Array(16);
            var cardsFlips = new Array(16);
            var cardsSolved = new Array(16);
            var maxAllowedCards = 2;
            var previousFlipedCard;
            var currentCards = 0;
            var remainingCards = 16;
            var timePlayed = 0.00;
            
            var timePlayedInterval = setInterval(function(){
                timePlayed += 0.01;
                document.getElementById('timePlayed').innerHTML = parseInt(timePlayed * 100) / 100;
                document.getElementById('hiddenTimePlayed').value = parseInt(timePlayed * 100) / 100;
            }, 10);
            
            onload = function () {
                var matches = new Array(8);
                var html = '<br>';
                var name;
                
                document.getElementById('timePlayed').innerHTML = timePlayed;
                
                for (var i = 0; i < matches.length; i++) {
                    matches[i] = 0;
                }

                for (var i = 0; i < cardsFlips.length; i++) {
                    cardsFlips[i] = false;
                }

                for (var i = 0; i < cardsSolved.length; i++) {
                    cardsSolved[i] = false;
                }


                for (var i = 0; i < 4; i++) {
                    for (var j = 0; j < 4; j++) {
                        name = Math.floor(Math.random() * 8);
                        if (matches[name] < 2) {
                            matches[name]++;
                            cardsImages[i * 4 + j] = name;
                            html += '<img id=\"' + (i * 4 + j) + '\" src=\"images/questionMark.jpg\" width="130" height="130" onmouseover=\"imgMouseOver(this)\" onmouseout=\"imgMouseOut(this)\" onclick=\"imgClick(this)\">';
                        } else {
                            j--;
                        }
                    }
                    html += '<br>';
                }
                document.getElementById("cardsPanel").innerHTML = html;
            };

            function imgMouseOver(obj) {
                obj.width = 150;
                obj.height = 150;
            }

            function imgMouseOut(obj) {
                obj.width = 130;
                obj.height = 130;
            }

            function flipCard(obj) {
                if (!cardsFlips[obj.id]) {
                    obj.src = "images/" + cardsImages[obj.id] + ".jpg";
                } else {
                    obj.src = "images/questionMark.jpg";
                }
                cardsFlips[obj.id] = !cardsFlips[obj.id];
            }

            function imgClick(obj) {
                if (!obj.disabled) {
                    flipCard(obj);
                    for (var i = 0; i < cardsImages.length; i++) {
                        document.getElementById(i).disabled = true;
                    }
                    setTimeout(function () {
                        if (obj.id !== previousFlipedCard) {
                            currentCards++;
                            if (currentCards === maxAllowedCards) {
                                currentCards = 0;
                                if (cardsImages[previousFlipedCard] === cardsImages[obj.id]) {
                                    for (var i = 0; i < cardsImages.length; i++) {
                                        if (!cardsSolved[i]) {
                                            document.getElementById(i).disabled = false;
                                        }
                                    }
                                    document.getElementById(previousFlipedCard).src = 'images/checked.jpg';
                                    document.getElementById(previousFlipedCard).disabled = true;
                                    cardsSolved[previousFlipedCard] = true;
                                    obj.src = 'images/checked.jpg';
                                    obj.disabled = true;
                                    cardsSolved[obj.id] = true;
                                    remainingCards -= 2;
                                    
                                    if (remainingCards === 0) {
                                        clearInterval(timePlayedInterval);
                                        alert('Congratulations!');
                                        document.getElementById('hiddenForm').submit();
                                    }
                                } else {
                                    flipCard(document.getElementById(previousFlipedCard));
                                    flipCard(obj);
                                    for (var i = 0; i < cardsImages.length; i++) {
                                        if (!cardsSolved[i]) {
                                            document.getElementById(i).disabled = false;
                                        }
                                    }
                                }
                                previousFlipedCard = undefined;
                            } else {
                                previousFlipedCard = obj.id;
                                for (var i = 0; i < cardsImages.length; i++) {
                                    if (!cardsSolved[i]) {
                                        document.getElementById(i).disabled = false;
                                    }
                                }
                            }
                        } else {
                            currentCards--;
                            previousFlipedCard = undefined;
                            for (var i = 0; i < cardsImages.length; i++) {
                                if (!cardsSolved[i]) {
                                    document.getElementById(i).disabled = false;
                                }
                            }
                        }
                    }, 1000);

                }
            }
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div id="cardsPanel" class="col-md-6">

                </div>
                <div class="col-md-6">
                    <p><strong>Time: </strong><span id="timePlayed"></span></p>
                    <form id="hiddenForm" style="display: none;" method="post" action="saveGame.jsp">
                        <input type="hidden" id="hiddenTimePlayed" name="timePlayed">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<%
        }
    }
%>
