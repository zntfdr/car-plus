<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import="Entita.Utente" %>
<%@ page import="Entita.Utente.Type" %>
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
		    <link rel="icon" type="image/png" href="../img/favicon.png" />
		    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
		    <title>Car+ | Il nuovo servizio di Car Pooling</title>
		    <script>
		    	$(document).ready(function(){
		    		$("ul#user_navigation li").hover(function(e){
		    											e.preventDefault();
		    											$(this).find("img").animate({bottom: '+=75'}, 400, 'swing');
		    										}, 
		    										 function(e){
		    											$(this).stop(true,true);
		    											$(this).find("img").animate({bottom: '-=75'}, 400, 'swing');
		    										});
		    	});
		    </script>
		</head>
		
		<body>
		    
		    <%= HTMLManager.getHeader(session) %>
		    
		    <div id="content">
		        <div class="wrapper">
		        <div id="account-type" >Account <%= user.getUserType() %></div>
		        <% if(session.getAttribute("descrizione") != null) { %><%= session.getAttribute("descrizione") %><br/><% session.removeAttribute("descrizione"); } %>
		        Benvenuto <b><%= user.getNome() %></b>,<br/> scegli l'azione desiderata:
		        <ul id="user_navigation">
        			<a href="search.jsp"><li><h1>Ricerca un tragitto</h1><img src="../img/wheel.png"/></li>
					<a href="new_tragitto.jsp"><li><h1>Inserisci un nuovo tragitto</h1><img src="../img/wheel.png"/></li></a> <!-- inserimento TRAGITTO CP  -->
					<a href="iltuoprofilo.jsp"><li><h1>Il tuo Profilo</h1><img src="../img/user.png"/></li></a>
					<a href="update_account.jsp"><li><h1>Aggiorna il tuo profilo</h1><img src="../img/wrench.png"/></li></a> <!-- modifica utente  -->
        			<% if(user.getUserType() == Type.CLIENTE || user.getUserType() == Type.BUSINESS) { %>
            		<a href="new_tragitto_cs_check.jsp"><li><h1>Prenota una macchina</h1><img src="../img/booking.png"/></li></a> <!--  prenota tragitto car sharing -->
                    <a href="iltuoconto.jsp"><li><h1>Il tuo Conto</h1><img src="../img/money.png"/></li></a> <!-- Visualizzazione conto -->
                    <a href="lista_TragittiCSinfo_cliente.jsp"><li><h1>I tuoi viaggi di Car Sharing</h1><img src="../img/faq.png"/></li></a> <!-- Visualizzazione lista_TragittiCSinfo_cliente -->
                    <a href="lista_TragittiCP_utente.jsp"><li><h1>I tuoi viaggi di Car Pooling</h1><img src="../img/faq.png"/></li></a> <!-- Visualizzazione lista viaggio car pooling -->
					<a href="lista_contratti_utente.jsp"><li><h1>I tuoi contratti</h1><img src="../img/faq.png"/></li></a> <!-- Visualizzazione lista_contratti -->
					<% } else { %><a href="lista_TragittiCP_utente.jsp"><li><h1>I tuoi viaggi di Car Pooling</h1><img src="../img/faq.png"/></li></a> <!-- Visualizzazione lista viaggio car pooling --><% } %>
				</ul>        
		        <div style="clear: both;"></div>
		        </div>
		    </div>
		    <div id="footer">
		    </div>
		</body>
		
		</html>
<% } %>
