<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Contratto"%>
<%@ page import="Entita.Abbonamento"%>
<%@ page import="Entita.Contratto" %>
<%@ page import="Entita.Utente" %>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Store.*" %>
<%@ page import = "Utils.HTMLManager" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato");
	if (user == null) { //Controllo che sia aperta una connessione, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else { %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Caratteristiche di un contratto | Car+</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%= HTMLManager.getHeader(session) %>
	            <div id="content">
        <div class="wrapper">
	<% int idc = Integer.parseInt(request.getParameter("contratto"));
	   Abbonamento a = Store.StoreAbbonamento.readAbbonamento(Store.StoreContratto.readContratto(idc).getNome_abbonamento()); %>
        <h1>Caratteristiche contratto:</h1>
        
         <ul id="description">
        	<li><h1>Descrizione Viaggio:</h1></li>
        	<li><span class="label">ID Contratto:</span><%= idc %></li>
        	<li><span class="label">Nome Contratto:</span><%= a.getNome() %></li>
        	<li><span class="label">Descrizione:</span><%= a.getDescrizione() %></li>
        	<li><span class="label">Tariffa al km per viaggi entro i 100km:</span><%= a.getTariffa_min_100km() %></li>
        	<li><span class="label">Tariffa al km per viaggi oltre i 100km:</span><%= a.getTariffa_magg_100km() %></li>
        	<li><span class="label">Tariffa oraria diurna:</span><%= a.getTariffa_diurna() %></li>
        	<li><span class="label">Tariffa oraria notturna:</span><%= a.getTariffa_notturna() %></li>
        	<li><span class="label">Costo Mensile:</span><%= a.getCosto_mensile() %></li>
        	<li><span class="label">Numero minimo tessere:</span><%= a.getNum_min_tessere() %></li>
        	<li><span class="label">Numero massimo tessere:</span><%= a.getNum_max_tessere() %></li>
        	
        </ul>
        
       	<div style="clear: both;"></div>
		</div>
	</div>
    <div id="footer"></div>
  </body>
</html>
  <% } %>