<%@ page import="Entita.Stazione_CS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
		response.sendRedirect("login.jsp");
	} else {
	Stazione_CS stazione = Store.StoreStazione_CS.readStazione_CS(request.getParameter("citta"), request.getParameter("provincia"), request.getParameter("nome"));
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiorna la stazione <%= stazione.getNome() %> | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js" ></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <script>
    $(document).ready(function(){
        $("#num_places").keypress(function(e){
            if(e.keyCode < 48 || e.keyCode > 57) return false;
            return true;
        });
    });    </script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
       
        <form method="POST" action="../UpdateStazioneCS" id="register">
            <ul>
                <li><h1>Aggiornamento della Stazione <%= stazione.getNome() %></h1></li>
                <!-- parametri da passare alla servlet per capire quale stazione aggiornare --> <li><input name="oldname" id="oldname" type="hidden" value="<%= stazione.getNome() %>" placeholder="Nome"/></li>
                <li><input name="oldprovince" id="oldprovince" type="hidden" value="<%= stazione.getProvincia() %>" placeholder="Provincia"/></li>
                <li><input name="oldcity" id="oldcity" type="hidden" value="<%= stazione.getCitta() %>" placeholder="Città"/></li>
                <!-- parametri da moificare --> <li><input name="name" type="text" id="name" value="<%= stazione.getNome() %>" placeholder="Nome"/></li>
                <li><input name="address" type="text" id="address" value="<%= stazione.getIndirizzo() %>" placeholder="Indirizzo"/></li>
                <li><input name="province" type="text" id="province" value="<%= stazione.getProvincia() %>" placeholder="Provincia"/></li>
                <li><input name="city" type="text" id="city" value="<%= stazione.getCitta() %>" placeholder="Città"/></li>
                <li><input name="num_places" type="text" id="num_places" value="<%= stazione.getNum_posti() %>" placeholder="Numero posti"/></li>
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