<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Modello_Macchina"%>
<%@ page import="Store.*" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista dei Modelli di macchina | Car+</title>
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
        <h1>Lista dei modelli di macchina</h1>
    	<table id="trip_list">
      		<tr>
		        <td><b>Id</b></td>
				<td><b>Marca</b></td>
				<td><b>Modello</b></td>
				<td><b>Motore</b></td>
				<td><b>Anno</b></td>
				<td><b>Alimentazione</b></td>
				<td><b>Emissioni Co2</b></td>
				<td><b>Numero Posti</b></td>
				<td><b>Modifica</b></td>
        		<td><b>Cancella</b></td>
      		</tr>
  			<% for(Modello_Macchina A : Store.StoreModello_Macchina.getModello_Macchina()){
  			%>
      		<tr>
				<td><%= A.getId() %></td>
				<td><%= A.getMarca() %></td>
				<td><%= A.getModello() %></td>
				<td><%= A.getCilindrata() %> <% if(A.getAlimentazione().equals("Elettrica") ) { %>Kw/h<% } else { %>cc<% } %></td>
				<td><%= A.getAnno() %></td>
				<td><%= A.getAlimentazione() %></td>
				<td><%= A.getEmissioni_co2() %> g/Km</td>
				<td><%= A.getNum_posti() %></td>
        		<td> <a href="update_car_model.jsp?id=<%= A.getId() %>"><img src="../img/ic_edit.png"></a></td>
        		<td> <a href="../CancellaModelloMacchina?id=<%= A.getId() %>"><img src="../img/ic_cancel.png"></a></td>
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