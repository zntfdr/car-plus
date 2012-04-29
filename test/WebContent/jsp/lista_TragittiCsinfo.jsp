<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CS_info"%>
<%@ page import="Entita.Utente"%>
<%@ page import="Entita.Cliente"%>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Store.StoreTragitto_CS_info"%>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {
	String PatternRegExVisualizzazioneEmail = "(.*)@(.*)";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Strict//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Visualizza tutti i tragitti | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
</head>
<body>
	<%=HTMLManager.getHeader(session)%>
    <div id="content">
        <div class="wrapper">
			<%  ArrayList<Tragitto_CS_info> listaCSinfo;
			    ArrayList<Cliente> listaClienti = Store.StoreCliente.getClienti();
			%>
			<% if(session.getAttribute("descrizione") != null) { %><%= session.getAttribute("descrizione") %><% session.removeAttribute("descrizione"); } %>
			<h1>Tutti i tragitti di Car Sharing:</h1>
      	  <table>
      	    <tr>
      	     <th>E-mail utente</th>
       		 <th>Tessera</th>
       		 <th>Contratto</th>
       		 <th>Stazione</th>
       		 <th>Localit&agrave;</th>
       		 <th>Veicolo</th>
      	     <th>Tempo <br/> Prelievo <br/> Prenotazione <br/> / <br/> Effettivo</th>
      		 <th>Tempo <br/> Consegna <br/> Prenotazione <br/> / <br/> Effettivo</th>
             <th>Strada effettuata</th>
             <th></th>
             <th>Pagato</th>
            </tr>
      <%
      	for (Cliente C : listaClienti) {
      		listaCSinfo = Store.StoreTragitto_CS_info.readTragitto_CS_info_cliente(C.getEmail_utente());
            for (Tragitto_CS_info T : listaCSinfo) { %>
            <tr>
            <td> <%=T.getEmail_cliente().replaceAll(PatternRegExVisualizzazioneEmail, "$1<br/>@<br/>$2") %> </td>
            <td> <a href="../jsp/lista_TragittiCSinfo_tessera.jsp?tessera=<%=T.getId_tessera()%>"> <%=T.getId_tessera()%></a></td>
            <td> <a href="../jsp/lista_TragittiCSinfo_contratto.jsp?contratto=<%=T.getContratto()%>"> <%=T.getContratto()%></a></td>
            <td> <%=T.getNome()%></td>
            <td> <%=T.getCitta()%> (<%=T.getProvincia()%>)</td>
            <td> <%=T.getMarca()%> <%=T.getModello_macchina()%></td>
            <td> <%=Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo_prenotazione())%><br/>/<br/>
            <%
            	String tp = Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo());
            	
            	if (tp.equals("1111/11/11 00:00:00"))
            		tp = "Tragitto non effetuato"; %><%=tp %></td>
            <td> <%=Utils.TimeString.dataOraCalendarToString(T.getTempo_consegna_prenotazione())%><br/>/<br/>
              <%
              	String tc = Utils.TimeString.dataOraCalendarToString(T.getTempo_consegna());
              	
              	if (tc.equals("1111/11/11 00:00:00"))
              		tp = "Tragitto non effetuato"; %> <%=tp%></td>
            <td> <% if(tp.equals("Tragitto non effetuato")) {%><%=tp%><%} else {%><%=T.getKm_totali() + " km"%><%} %></td>
            <td>
            	<% if(tp.equals("Tragitto non effetuato")) { %>
            	<ul id="tools">
            		<li><a href="update_cs_trip.jsp?id=<%=T.getId() %>"><img src="../img/ic_edit.png"></a></li></a></li>
            	</ul>
            	<% } %>
            </td>
            <td> <%
 	if (T.getPagato()) {
 %> &#10003;<%
 	} else {
 %> &#10007;<%
 	}
 %></td></tr><%	}	}  %>
 		</table>
    	<div style="clear: both;"></div>
		</div>
	</div>
    <div id="footer"></div>
</body>
</html>
<% } %>