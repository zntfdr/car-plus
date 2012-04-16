<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CS_info"%>
<%@ page import="Entita.Contratto"%>
<%@ page import="Store.StoreTragitto_CS_info"%>
<%@ page import="Store.StoreContratto"%>
<%@ page import = "Utils.HTMLManager" %>


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
   <% int idc = Integer.parseInt(request.getParameter("contratto"));
   Contratto c = Store.StoreContratto.readContratto(idc); %>
   Id contratto : <%= idc %> 
   Tipo di abbonamento : <%= c.getNome_abbonamento() %>
   Data stipula :  <%= c.getData_stipula() %>
   Data scadenza :  <%= c.getData_scadenza() %>
     <%ArrayList<Tragitto_CS_info> listaCSinfo = Store.StoreTragitto_CS_info.readTragitto_CS_info_contratto(idc); %>
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
<% for(Tragitto_CS_info T : listaCSinfo){%>
      <tr>
      <td> <a href="../jsp/lista_TragittiCSinfo_tessera.jsp?tessera=<%= T.getTessera() %>"> <%= T.getTessera() %></a></td>
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
  </body>
</html>
