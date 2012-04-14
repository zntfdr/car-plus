<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CS_info"%>
<%@ page import="Entita.Utente" %>
<%@ page import="Entita.Contratto" %>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Store.StoreContratto"%>
<%@ page import = "Utils.HTMLManager" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato"); 
   String email_cliente = user.getEmail();%>
   
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
    <table border="1">

      <tr>
        <td><b>Nome Contratto</b></td>
        <td><b>Data Stipula</b></td>
        <td><b>Data Scadenza</b></td>
        <td><b>Tessere Associate</b></td>

      </tr>
  <% ArrayList<Contratto> lista = Store.StoreContratto.listaContrattiUtente(email_cliente);
         for(Contratto C : lista){%> 
      <tr>
        <td> <%= C.getNome_abbonamento() %></td>
        <td> <%= Utils.TimeString.dataOraCalendarToString(C.getData_stipula()) %></td>
        <td> <%= Utils.TimeString.dataOraCalendarToString(C.getData_scadenza()) %></td>
        <td> <%= Store.StoreContratto.CountTessere(C)%></td>
      </tr>
    <% } %>
    </table>
    <div id="footer">
    <div class="wrapper">
    </div>
    </div>
  </body>
</html>
