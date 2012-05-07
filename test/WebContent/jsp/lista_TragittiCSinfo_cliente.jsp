<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CS_info"%>
<%@ page import="Entita.Utente"%>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Store.StoreTragitto_CS_info"%>
<%@ page import = "Utils.HTMLManager" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato");
	if (user == null) { //Controllo che sia aperta una connessione, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else {
	String email_cliente = user.getEmail();
%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Strict//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Visualizza i tuoi tragitti | Car+</title>
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
			<%
				ArrayList<Tragitto_CS_info> listaCSinfo = Store.StoreTragitto_CS_info.readTragitto_CS_info_cliente(email_cliente);
				if (listaCSinfo.isEmpty()) {
			%>
					<%=email_cliente%>, non hai ancora fatto uso del servizio di car sharing. Cosa aspetti? <a href="../jsp/new_tragitto_cs_check.jsp">prenota un tragitto</a>!
			<%
				} else {
			%>
			<h1>I tuoi viaggi:</h1>
      	  <table>
      	    <tr>
       		 <th>Tessera</th>
       		 <th>Contratto</th>
       		 <th>Stazione</th>
       		 <th>Localit&agrave;</th>
       		 <th>Veicolo</th>
      	     <th>Tempo Prelievo Prenot.</th>
      		 <th>Tempo Consegna Prenot.</th>
      	     <th>Tempo Prelievo</th>
             <th>Tempo Consegna</th>
             <th>Km effettuati</th>
             <th>Pagato</th>
            </tr>
      <%
      	for (Tragitto_CS_info T : listaCSinfo) {
      %>
            <tr>
            <td ><a href="../jsp/lista_TragittiCSinfo_tessera.jsp?tessera=<%=T.getId_tessera()%>"> <%=T.getId_tessera()%></a></td>
            <td> <a href="../jsp/lista_TragittiCSinfo_contratto.jsp?contratto=<%=T.getContratto()%>"> <%=T.getContratto()%></a></td>
            <td> <%=T.getNome()%></td>
            <td> <%=T.getCitta()%> (<%=T.getProvincia()%>)</td>
            <td> <%=T.getMarca()%> <%=T.getModello_macchina()%></td>
            <td> <%=Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo_prenotazione()).replaceAll("(.*):00", "$1")%></td>
            <td> <%=Utils.TimeString.dataOraCalendarToString(T.getTempo_consegna_prenotazione()).replaceAll("(.*):00", "$1")%></td>
            <td><%
            		String tp = Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo());
            		if (tp.equals("1111/11/11 00:00:00")) { 
            	%>Tragitto non effetuato
            	<%
            		} else { %><%=tp.replaceAll("(.*):00", "$1")%><% }
            	%>
            </td>
            <td><%
              		String tc = Utils.TimeString.dataOraCalendarToString(T.getTempo_consegna());
              		if (tc.equals("1111/11/11 00:00:00")) {
              	%>Tragitto non effetuato
              	<%
            		} else { %><%=tc.replaceAll("(.*):00", "$1")%><% }
             	%>
             </td>
            <td> <% if(T.getKm_totali() == 0) {%> Tragitto non effetuato <% } else { %><%=T.getKm_totali() %><%}%></td>
            <td> <%
 	if (T.getPagato()) {
 %> &#10003;<%
 	} else {
 %> &#10007;<%
 	}
 %></td>
           </tr> <%
 	}
 %>
         </table>
      <%
      	}
      %>
    	<div style="clear: both;"></div>
		</div>
	</div>
    <div id="footer"></div>
</body>
</html>
<% } %>
