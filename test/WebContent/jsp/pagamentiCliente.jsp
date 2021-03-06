<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CS_info"%>
<%@ page import="Entita.Utente"%>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Store.StoreTragitto_CS_info"%>
<%@ page import = "Utils.HTMLManager" %>
<% if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {
	String email_cliente = (String)session.getAttribute("email_cliente");
%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Strict//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Pagamento tragitti cliente | Car+</title>
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
        <% if(session.getAttribute("descrizione") != null) { %><%= session.getAttribute("descrizione") %><% session.removeAttribute("descrizione"); } %>
			<%
			ArrayList<Tragitto_CS_info> listaCSinfo = Store.StoreTragitto_CS_info.readTragitto_CS_info_cliente(email_cliente);
;
				if (listaCSinfo.isEmpty()) {
			%>
					<%=email_cliente%>, non ha ancora effettuato prenotazioni.
			<%
				} else {
			%>
			<h1>I suoi viaggi:</h1>
      	  <table border="1">
      	    <tr>
       		 <th>Tessera</th>
       		 <th>Contratto</th>
       		 <th>Stazione</th>
       		 <th>Localit&agrave;</th>
       		 <th>Veicolo</th>
      	     <th>Tempo Prelievo</th>
             <th>Tempo Consegna</th>
             <th>Km effettuati</th>
             <th>Totale</th>
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
            <%
            	String tp = Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo());
            			if (tp.equals("1111/11/11 00:00:00")) {
            %>
            	<td>  Tragitto non effettuato</td>
            <%
            	} else {
            %>
            	<td> <%=tp%></td>
             	<%
             		}
             	%>
              <%
              	String tc = Utils.TimeString.dataOraCalendarToString(T
              					.getTempo_consegna());
              			if (tc.equals("1111/11/11 00:00:00")) {
              %>
            	<td> Tragitto non effettuato</td>
            <%
            	} else {
            %>
            	<td> <%=tc%></td>
             	<%
             		}
             	%>
            <td> <%=T.getKm_totali()%></td>
            <td> <%=T.getCosto() %>&euro;</td>
            <td> <%
 	if (T.getPagato()) {
 %> &#10003; <br><a href="../Paga?cliente=<%=email_cliente %>&idTragitto=<%=T.getId() %>&paga=false" onClick="return confirm('Sei sicuro di voler annullare il pagamento?');" target="_self">Annulla pagamento</a><%
 	} else {
 %> &#10007; <br><a href="../Paga?cliente=<%=email_cliente %>&idTragitto=<%=T.getId() %>&paga=true" onClick="return confirm('Sei sicuro di voler pagare?');" target="_self">Paga ora</a><%
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
