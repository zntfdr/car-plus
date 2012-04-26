<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CS_info"%>
<%@ page import = "Utils.HTMLManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Strict//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
   <body>
    <table>

      <tr>
        <th>Nome Stazione</th>
        <th>Citt&agrave;</th>
        <th>Provincia</th>
        <th>Marca Veicolo</th>
        <th>Modello Veicolo</th>
        <th>Tempo Prelievo Prenotazione</th>
        <th>tempo Consegna Prenotazione</th>
        <th>Tempo Prelievo</th>
        <th>Tempo Consegna</th>
        <th>Km effettuati</th>
        <th>Pagato</th>
      </tr>
  <% ArrayList<Tragitto_CS_info> listaCSinfo = (ArrayList<Tragitto_CS_info>) session.getAttribute("lista_tragitti");
     
     for(Tragitto_CS_info T : listaCSinfo){%>
      <tr>
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
