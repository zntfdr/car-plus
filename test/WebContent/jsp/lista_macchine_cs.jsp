<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Macchina_CS"%>
<%@ page import="Store.*" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista delle Macchine di Car Sharing | Car+</title>
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
        <% if(session.getAttribute("descrizione") != null) { %><%= session.getAttribute("descrizione") %><% session.removeAttribute("descrizione"); } %>
        <h1>Lista delle Macchine di Car Sharing</h1>
    	<table id="trip_list">
      		<tr>
		        <td><b>provincia</b></td>
		        <td><b>citta</b></td>
		        <td><b>nome stazione CS</b></td>
		        <td><b>id modello</b></td>
		        <td><b>targa</b></td>
				<td><b>anno acquisto</b></td>
				<td><b>scad bollo</b></td>
				<td><b>scad assicurazione</b></td>
				<td><b>scad revisione</b></td>
				<td><b>km totali</b></td>
				<td><b>prenotabile</b></td>
				<td><b>Modifica</b></td>
        		<td><b>Cancella</b></td>
      		</tr>
  			<% for(Macchina_CS A : Store.StoreMacchina_CS.getMacchina_CS()){ %>
      		<tr>
				<td><%= A.getProvincia() %></td>
				<td><%= A.getCitta() %></td>
				<td><%= A.getNome_stazione_CS() %></td>
				<td><%= A.getId_modello() %></td>
				<td><%= A.getTarga() %></td>
				<td><%= A.getAnno_acquisto() %></td>
				<td><%= Utils.TimeString.dataCalendarToString(A.getScad_bollo()) %></td>
				<td><%= Utils.TimeString.dataCalendarToString(A.getScad_assicurazione()) %></td>
				<td><%= Utils.TimeString.dataCalendarToString(A.getScad_revisione()) %></td>
				<td><%= A.getKm_totali() %></td>
				<td><%= A.getPrenotabile() %></td>
        		<td> <a href="update_cs_car.jsp?targa=<%= A.getTarga() %>"><img src="../img/ic_edit.png"></a></td>
        		<td> <a href="../CancellaMacchinaCS?targa=<%= A.getTarga() %>"><img src="../img/ic_cancel.png"></a></td>
      		</tr>
		    <% } %>
    	</table>
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