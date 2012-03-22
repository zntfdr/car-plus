<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CP"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Strict//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
   <body>
    <table border="1">

      <tr>
        <td><b>Partenza</b></td>
        <td><b>Arrivo</b></td>
        <td><b>Utente</b></td>
        <td><b>Posti</b></td>
        <td><b>Macchina</b></td>
      </tr>
  <% ArrayList<Tragitto_CP> listaCP= new ArrayList<Tragitto_CP>();
     listaCP = (ArrayList<Tragitto_CP>) session.getAttribute("listaTragitti_CP");
     for(Tragitto_CP T : listaCP){%>
      <tr>
        <td> <%= T.getLocalita_partenza() %></td>
        <td> <%= T.getLocalita_arrivo() %></td>
        <td> <%= T.getEmail_utente() %></td>
        <td> <%= T.getNum_posti() %></td>
        <td> <%= T.getTarga_CP() %></td>
      </tr>
    <% } %>
    </table>

  </body>
</html>
