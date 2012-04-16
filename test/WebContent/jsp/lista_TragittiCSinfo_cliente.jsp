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
<head>
<meta charset="UTF-8">
<title>Visualizza i tragitti effettuati dal cliente | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
</head>
   <body>
       <%= HTMLManager.getHeader(session) %>
   <%ArrayList<Tragitto_CS_info> listaCSinfo = Store.StoreTragitto_CS_info.readTragitto_CS_info_cliente(email_cliente);
     if (listaCSinfo.isEmpty())
    	  { %>
           <div id="content">
            <div class="wrapper">
            <%=email_cliente%> , non hai ancora fatto uso del servizio di car sharing. Cosa aspetti? <a href="../jsp/new_tragitto_cs_check.jsp">prenota un tragitto</a>!
            <div style="clear: both;"></div>
            </div>
           </div>
       <% }
     else 
          { %>
          <h1>Tutti i tuoi tragitti:</h1>
      	  <table border="1">
      	    <tr>
       		 <td><b>Tessera</b></td>
       		 <td><b>Contratto</b></td>
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
      <% for(Tragitto_CS_info T : listaCSinfo){%>
            <tr>
            <td ><a href="../jsp/lista_TragittiCSinfo_tessera.jsp?tessera=<%= T.getTessera() %>"> <%= T.getTessera() %></a></td>
            <td> <a href="../jsp/lista_TragittiCSinfo_contratto.jsp?contratto=<%= T.getContratto() %>"> <%= T.getContratto() %></a></td>
            <td> <%= T.getNome() %></td>
            <td> <%= T.getCitta() %></td>
            <td> <%= T.getProvincia() %></td>
            <td> <%= T.getMarca() %></td>
            <td> <%= T.getModello_macchina() %></td>
            <td> <%= Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo_prenotazione())%></td>
            <td> <%= Utils.TimeString.dataOraCalendarToString(T.getTempo_consegna_prenotazione()) %></td>
            <% String tp = Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo());
            if (tp.equals("1111/11/11 00:00:00")){%>
            	<td>  La data di prelievo effettiva non e' ancora stata inserita</td>
            <%} else { %>
            	<td> <%= tp %></td>
             	<%} %>
              <% String tc = Utils.TimeString.dataOraCalendarToString(T.getTempo_consegna());
            if (tc.equals("1111/11/11 00:00:00")){%>
            	<td>  La data di consegna effettiva non e' ancora stata inserita</td>
            <%} else { %>
            	<td> <%= tc %></td>
             	<%} %>
            <td> <%= T.getKm_totali() %></td>
            <td> <% if (T.getPagato()){ %> &#10003;<% } 
                    else { %> &#10007;<% }  %></td>
           </tr> <% } %>
         </table>
      <% } %>
    <div id="footer">
    <div class="wrapper">
    </div>
    </div>
  </body>
</html>
