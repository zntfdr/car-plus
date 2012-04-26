<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CP"%>
<%@ page import="Entita.Utente"%>
<%@ page import="Entita.Utente.Type" %>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import = "Servlet.Interrogazione" %>
<%@page import="Utils.TimeString"%>

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
<title>Visualizza i tuoi viaggi di Car Pooling | Car+</title>
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
				ArrayList<Tragitto_CP> listaCreatiDaUtente = Interrogazione.listaTraggittiUtenteCreatiDaLui(email_cliente);
				ArrayList<Tragitto_CP> listaInCuiPartecipa = Interrogazione.listaTraggittiUtenteInCuiPartecipa(email_cliente);
				if (listaCreatiDaUtente.isEmpty() && listaInCuiPartecipa.isEmpty()) {
			%>
					<%=email_cliente%>, non hai ancora fatto uso del servizio di car pooling. Cosa aspetti? <a href="../jsp/new_tragitto.jsp">inserisci un nuovo viaggio</a>!
			<%
				} else {
			%>
			<h1>I tuoi viaggi:</h1>
      	  <table>
      	    <tr>
		        <th>Fumatori</th>
				<th># posti</th>
				<th>Note</th>
				<th>Citt&agrave; partenza</th>
				<th>Provincia partenza</th>
				<th>Citt&agrave; arrivo</th>
				<th>Provincia arrivo</th>
				<th>Targa CP</th>
				<th>Tempo partenza</th>
				<th>Tempo arrivo</th>
            </tr>
      <%
      	for (Tragitto_CP tcp : listaCreatiDaUtente) {
      %>
 				<tr>
					<td><%=tcp.getFumatori()%></td>
					<td><%=tcp.getNum_posti()%></td>
					<td><%=tcp.getNote()%></td>
					<td><%=tcp.getCitta_partenza()%></td>
					<td><%=tcp.getProvincia_partenza()%></td>
					<td><%=tcp.getCitta_arrivo()%></td>
					<td><%=tcp.getProvincia_arrivo()%></td>
					<td><%=tcp.getTarga_CP()%></td>
					<td><%=TimeString.dataOraCalendarToString(tcp.getTempo_partenza())%></td>
					<td><%=TimeString.dataOraCalendarToString(tcp.getTempo_arrivo())%></td>
				</tr>
				<%
					}
				%>
    </table>
    
    <h1>I viaggi in cui partecipi:</h1>
      	  <table>
      	    <tr>
       			<th>Fumatori</th>
				<th># posti</th>
				<th>Note</th>
				<th>Citt&agrave; partenza</th>
				<th>Provincia partenza</th>
				<th>Citt&agrave; arrivo</th>
				<th>Provincia arrivo</th>
				<th>Targa CP</th>
				<th>Tempo partenza</th>
				<th>Tempo arrivo</th>
            </tr>
      <%
      	for (Tragitto_CP tcp : listaInCuiPartecipa) {
      %>
 				<tr>
					<td><%=tcp.getFumatori()%></td>
					<td><%=tcp.getNum_posti()%></td>
					<td><%=tcp.getNote()%></td>
					<td><%=tcp.getCitta_partenza()%></td>
					<td><%=tcp.getProvincia_partenza()%></td>
					<td><%=tcp.getCitta_arrivo()%></td>
					<td><%=tcp.getProvincia_arrivo()%></td>
					<td><%=tcp.getTarga_CP()%></td>
					<td><%=TimeString.dataOraCalendarToString(tcp.getTempo_partenza())%></td>
					<td><%=TimeString.dataOraCalendarToString(tcp.getTempo_arrivo())%></td>
				</tr>
				<%
					}
				%>
    </table>
    	<div style="clear: both;"></div>
		</div>
	</div>
    <div id="footer"></div>
</body>
</html>
<% }} %>
