<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Cliente"%>
<%@ page import="Store.*" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista dei Clienti | Car+</title>
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
        <% if(session.getAttribute("descrizione") != null) { %><%= session.getAttribute("descrizione") %>avvenuta con successo!<% session.removeAttribute("descrizione");} %>
        <h1>Lista dei Clienti</h1>
    	<table id="trip_list">
      		<tr>
		        <th>Mail</th>
		        <th>Codice Fiscale</th>
		        <th>Cliente Business</th>
		        <th>Modifica</th>
		        <th>Cancella</th>
      		</tr>
  			<% ArrayList<Cliente> lista_clienti = StoreCliente.getClienti();
     		for(Cliente c : lista_clienti){ %>
      		<tr>
        		<td> <%= c.getEmail_utente() %></td>
        		<td> <%= c.getCodice_fiscale() %></td>
        		<td> <% if (StoreCliente_business.readCliente_business(c.getEmail_utente()) != null){ %> &#10003;<% } %></td>
        		<td> <a href="update_costumer.jsp?email=<%= c.getEmail_utente() %>"><img src="../img/ic_edit.png"></a></td>
        		<td> <a href="../CancellaCliente?email=<%= c.getEmail_utente() %>"><img src="../img/ic_cancel.png"></a></td>
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