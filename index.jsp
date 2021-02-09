<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="rannumstyle.css">
        <title>Random Number Game</title>
    </head>
    <body>
        <%
            byte mathNumber = ((byte)((Math.random()*100)+1));
            byte computerNumber = mathNumber;
            session.setAttribute("computerNumber", computerNumber);
        %>
        <h1>Welcome to the Random Number Game!</h1>
        <h1>I've selected a number between 1 and 100.</h1><br/>
        <h2>Guess the number in as few tries as possible.</h2>
        <form method="post" action="rannumgame.jsp">
            <h2>Enter your first guess: <br/><br/><input type="number" name="userGuess"/></h2>
            <input type="submit" value="Submit Guess"/>
            <input type="hidden" name="numGuess" value="1"/>
        </form>
    </body>
</html>