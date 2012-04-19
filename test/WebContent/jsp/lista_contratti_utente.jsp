<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CS_info"%>
<%@ page import="Entita.Utente" %>
<%@ page import="Entita.Contratto" %>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Servlet.Interrogazione" %>
<%@ page import="Store.StoreContratto"%>
<%@ page import = "Utils.HTMLManager" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato");
	if (user == null) { //Controllo che sia aperta una connessione, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else {
   String email_cliente = user.getEmail(); %>
   
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Lista contratti del cliente | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
</head>
   <body>
    <%= HTMLManager.getHeader(session) %>
            <div id="content">
        <div class="wrapper">
    <h1>Elenco dei tuoi contratti:</h1>
    <table border="1">
      <tr>
        <td><b>Id Contratto</b></td>
        <td><b>Tipo Contratto</b></td>
        <td><b>Data Stipula</b></td>
        <td><b>Data Scadenza</b></td>
        <td><b>Tessere Associate</b></td>
      </tr>
  <% ArrayList<Contratto> lista = Interrogazione.listaContrattiUtente(email_cliente);
         for(Contratto C : lista){ %> 
      <tr>
        <td ><a href="../jsp/caratteristiche_contratto.jsp?contratto=<%= C.getId() %>">  <%= C.getId() %></a></td>
        <td> <%= C.getNome_abbonamento() %></td>
        <td> <%= Utils.TimeString.dataCalendarToString(C.getData_stipula()) %></td>
        <td> <%= Utils.TimeString.dataCalendarToString(C.getData_scadenza()) %></td>
        <td> <%= Interrogazione.CountTessere(C)%></td>
      </tr>
    <% } %>
    </table>
       	<div style="clear: both;"></div>
		</div>
	</div>
    <div id="footer"></div>
  </body>
</html>
  <% } %>