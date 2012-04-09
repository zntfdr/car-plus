<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else { %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Nuova Macchina di Car Sharing | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>

</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <form method="GET" action="../Inserimento_localita" id="Inserimento_localita">
            <ul>
                <li><h1>Nuova Localit&agrave;</h1></li>
                <li><input name="city" type="text" id="city" placeholder="Citta"/></li>
                <li><input name="province" type="text" id="province" placeholder="Provincia"/></li>
                <li><button name="submit" type="submit" id="submit">Inserisci</button></li>
            </ul>
        </form>
        
        <div style="clear: both;"></div>
    	
        </div>
    </div>
    <div id="footer">
    	<div class="wrapper">
        </div>
    </div>
</body>
</html>
<% } %>