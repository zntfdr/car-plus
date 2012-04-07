<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import="Entita.Utente" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato");
	if (user == null) { //Controllo che sia aperta una connessione, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else {
%>
		<!DOCTYPE html>
		<html>
		
		<head>
		    <meta charset="UTF-8">
		    <link href="../css/base.css" type="text/css" rel="stylesheet" />
		    <title>Car+ | Il nuovo servizio di Car Pooling</title>
		</head>
		
		<body>
		    
		    <%= HTMLManager.getHeader(session) %>
		    
		    <div id="content">
		        <div class="wrapper">
		        Benvenuto <b><%= user.getNome() + "---" + user.getUserType() %></b>,<br/>
		        scegli l'azione desiderata:
		        
		        <%= HTMLManager.getUserMenu(user) %>
		        
		        <div style="clear: both;"></div>
		    
		        </div>
		    </div>
		    <div id="footer">
		    </div>
		</body>
		
		</html>
<% } %>
