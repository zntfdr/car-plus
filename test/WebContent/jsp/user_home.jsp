<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Entita.Utente" %>
<%@ page import = "Utils.HTMLManager" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato"); %>
<%
	if (user == null) {
		response.sendRedirect("../html/login.html");
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
		        <div id="actions">
		            <a href="../jsp/search.jsp"><div id="search"></div></a>
		            <a href="../jsp/new_tragitto.jsp"><div id="insert"></div></a>
		            <a href="../jsp/iltuoconto.jsp"><div id="account"></div></a>
		        </div>
		        <div style="clear: both;"></div>
		    
		        </div>
		    </div>
		    <div id="footer">
		    </div>
		</body>
		
		</html>
<% } %>
