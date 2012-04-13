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
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Strict//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
   <body>
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
        <td> <%= C.getData_stipula() %></td>
        <td> <%= C.getData_scadenza() %></td>
        <td> <%= Store.StoreContratto.CountTessere(C)%></td>
      </tr>
    <% } %>
    </table>
  </body>
</html>
