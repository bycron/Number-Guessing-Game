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
            String computerNumber = Byte.toString((byte)session.getAttribute("computerNumber"));
            byte randomNumber = Byte.parseByte(computerNumber);
            byte userGuess=0;
            byte numGuess=0;
            boolean isCorrect=false;
            boolean isCorrectTwo=false;
            
            try {
                userGuess=Byte.parseByte(request.getParameter("userGuess"));;
                numGuess=Byte.parseByte(request.getParameter("numGuess"));;
                isCorrectTwo=true;
            }
            catch (NumberFormatException e) {
                out.println("<h1>Please enter a number between 1 and 100.</h1>");
                out.println("<a href=\"index.jsp\">Start Over?</a>\n");
            }

            if ((isCorrectTwo==true)&&(userGuess>100||userGuess<1)) {
                out.println("<h1>Please enter a number between 1 and 100</h1>");
                out.println("<a href=\"index.jsp\">Start Over?</a>\n");
            }

            if ((userGuess>=1)&&(userGuess<=100)) {
                if (userGuess<randomNumber) {
                    out.println("<h1>You've guessed too low. Try again.</h1>");
                    numGuess++;
            }
            else if (userGuess>randomNumber) {
                out.println("<h1>You've guessed too high. Try again.</h1>");
                numGuess++;
            }
            else {
                isCorrect=true;
                out.println("<h1>You guessed it!</h1>\n<h2>It took you only " + numGuess + " tries!</h2>\n");
                out.println("<a href=\"index.jsp\">Play Again?</a>\n");
            }
            if (!isCorrect) {
                out.println("<form method=\"post\" action=\"rannumgame.jsp\">\n<h2>Enter guess number " + numGuess + 
                        ": </h2>\n<br/>\n<input type=\"number\" name=\"userGuess\">\n<br/><br/>\n<input type=\"submit\" value=\"Submit Guess\"/)>\n");
                out.println("<input type=\"hidden\" name=\"numGuess\" value=\"" + numGuess + "\"/>");
                out.println("</form>");
            }
        }
        %>
    </body>
</html>