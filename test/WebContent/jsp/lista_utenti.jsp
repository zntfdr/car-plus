<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Utente"%>
<%@ page import="Store.*" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista degli Utenti | Car+</title>
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
        <h1>Lista degli utenti</h1>
    	<table>
      		<tr>
		        <th>Mail</th>
		        <th>Nome</th>
		        <th>Cognome</th>
		        <th>Cliente</th>
		        <th id="th_tools"></th>
      		</tr>
  			<% ArrayList<Utente> lista_utenti = StoreUtente.getUtenti();
     			for(Utente c : lista_utenti){ %>
		      		<tr>
		        		<td> <%= c.getEmail() %></td>
		        		<td> <%= c.getNome() %></td>
		        		<td> <%= c.getCognome() %></td>
		        		<td> <% if (StoreCliente.readCliente(c.getEmail()) != null){ %> &#10003;<% } %></td>
		        		<td>
							<ul id="tools">
								<li><a href="update_account.jsp?email=<%= c.getEmail() %>"><img src="../img/ic_edit.png"></a></li>
								<li><a href="../CancellaUtente?email=<%= c.getEmail() %>"><img src="../img/ic_cancel.png"></a></li>
							</ul>
						</td>
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