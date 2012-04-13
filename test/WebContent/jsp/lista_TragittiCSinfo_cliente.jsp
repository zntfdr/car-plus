<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CS_info"%>
<%@ page import="Entita.Utente"%>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Store.StoreTragitto_CS_info"%>
<%@ page import = "Utils.HTMLManager" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato"); 
   String email_cliente = user.getEmail();%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Strict//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
   <body>
       <table border="1">

      <tr>
        <td><b>Tessera</b></td>
        <td><b>Nome Stazione</b></td>
        <td><b>Citta</b></td>
        <td><b>Provincia</b></td>
        <td><b>Marca Veicolo</b></td>
        <td><b>Modello Veicolo</b></td>
        <td><b>Tempo Prelievo Prenotazione</b></td>
        <td><b>tempo Consegna Prenotazione</b></td>
        <td><b>Tempo Prelievo</b></td>
        <td><b>Tempo Consegna</b></td>
        <td><b>Km effettuati</b></td>
        <td><b>Pagato</b></td>
      </tr>
  <% ArrayList<Tragitto_CS_info> listaCSinfo = Store.StoreTragitto_CS_info.readTragitto_CS_info_cliente(email_cliente);
     
     for(Tragitto_CS_info T : listaCSinfo){%>
      <tr>
        <td> <%= T.getTessera() %></td>
        <td> <%= T.getNome() %></td>
        <td> <%= T.getCitta() %></td>
        <td> <%= T.getProvincia() %></td>
        <td> <%= T.getMarca() %></td>
        <td> <%= T.getModello_macchina() %></td>
        <td> <%= Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo_prenotazione()) %></td>
        <td> <%= Utils.TimeString.dataOraCalendarToString(T.getTempo_consegna_prenotazione()) %></td>
        <td> <%= Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo())%></td>
        <td> <%= Utils.TimeString.dataOraCalendarToString(T.getTempo_consegna()) %></td>
        <td> <%= T.getKm_totali() %></td>
        <td> <%= T.getPagato() %></td>
      </tr>
    <% } %>
    </table>
  </body>
</html>
