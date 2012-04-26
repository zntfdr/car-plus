<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Contratto"%>
<%@ page import="Entita.Abbonamento"%>
<%@ page import="Entita.Utente"%>
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
	<% int idc = Integer.parseInt(request.getParameter("contratto"));
	   Abbonamento a = Store.StoreAbbonamento.readAbbonamento(Store.StoreContratto.readContratto(idc).getNome_abbonamento()); %>
        <h1>Caratteristiche contratto:</h1>
    	<table>
      		<tr>
      		    <th>Id contratto</th>
		        <th>Tipo contratto</th>
		        <th>Descrizione</th>
		        <th>Tariffa al km per viaggi entro i 100km</th>
		        <th>Tariffa al km per viaggi oltre i 100km</th>
		        <th>Tariffa oraria diurna</th>
		        <th>Tariffa oraria notturna</th>
				<th>Costo mensile</th>
      		</tr>
      		<tr>
				<td><%= idc %></td>
				<td><%= a.getNome()  %></td>
				<td><%= a.getDescrizione() %></td>
				<td><%= a.getTariffa_min_100km() %> &euro;</td>
				<td><%= a.getTariffa_magg_100km() %> &euro;</td>
        		<td><%= a.getTariffa_diurna() %> &euro;</td>
        		<td><%= a.getTariffa_notturna() %> &euro;</td>
        		<td><%= a.getCosto_mensile() %> &euro;</td>
      		</tr>
    	</table>
    <div id="footer">
    	<div class="wrapper">
        </div>
    </div>
</body>
</html>
<%}%>