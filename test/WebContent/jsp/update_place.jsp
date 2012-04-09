<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
		response.sendRedirect("login.jsp");
	} else {  %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiorna la località | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js" ></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <form method="POST" action="../UpdateLocalita" id="register">
            <ul>
                <li><h1>Aggiornamento la località</h1></li>
                <li><input name="oldcity" type="hidden" id="oldcity" value="<%= request.getParameter("citta") %>"/></li>
             	<li><input name="oldprovince" type="hidden" id="oldprovince" value="<%= request.getParameter("provincia") %>" placeholder="Provincia"/></li>  
                <li><input name="city" type="text" id="city" value="<%= request.getParameter("citta") %>" placeholder="Citta"/></li>
             	<li><input name="province" type="text" id="province" value="<%= request.getParameter("provincia") %>" placeholder="Provincia"/></li>                
                <li><button name="submit" type="submit" id="submit">Aggiorna</button></li>
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