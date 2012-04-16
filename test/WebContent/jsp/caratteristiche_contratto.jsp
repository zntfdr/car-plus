<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Contratto"%>
<%@ page import="Entita.Abbonamento"%>
<%@ page import="Store.*" %>
<%@ page import = "Utils.HTMLManager" %>

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
    	<table border="1">
      		<tr>
      		    <td><b>Id contratto</b></td>
		        <td><b>Tipo contratto</b></td>
		        <td><b>Descrizione</b></td>
		        <td><b>Tariffa al km per viaggi entro i 100km</b></td>
		        <td><b>Tariffa al km per viaggi oltre i 100km</b></td>
		        <td><b>Tariffa oraria diurna</b></td>
		        <td><b>Tariffa oraria notturna</b></td>
				<td><b>Costo mensile</b></td>
				<td><b>Numero minimo tessere</b></td>
				<td><b>Numero massimo tessere</b></td>
      		</tr>
      		<tr>
				<td><%= idc %></td>
				<td><%= a.getNome()  %></td>
				<td><%= a.getDescrizione() %></td>
				<td><%= a.getTariffa_min_100km() %></td>
				<td><%= a.getTariffa_magg_100km() %></td>
        		<td><%= a.getTariffa_diurna() %></td>
        		<td><%= a.getTariffa_notturna() %></td>
        		<td><%= a.getCosto_mensile() %></td>
        		<td><%= a.getNum_min_tessere() %></td>
        		<td><%= a.getNum_max_tessere() %></td>
      		</tr>
    	</table>
    <div id="footer">
    	<div class="wrapper">
        </div>
    </div>
</body>
</html>