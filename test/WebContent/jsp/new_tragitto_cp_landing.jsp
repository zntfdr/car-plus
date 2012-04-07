<%@page import="Utils.TimeString"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CP" %>
<%@ page import="java.util.Calendar" %>
<%@ page import = "Utils.HTMLManager" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione nuovo Tragitto avvenuta con successo!</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
</head>

<body>
	
	<%= HTMLManager.getHeader(session) %>
	
    <div id="content">
<div class="wrapper">
    <table id="trip_list">
      <tr>
        <td><b>fumatori</b></td>
<td><b>num posti</b></td>
<td><b>note</b></td>
<td><b>citta partenza</b></td>
<td><b>provincia partenza</b></td>
<td><b>citta arrivo</b></td>
<td><b>provincia arrivo</b></td>
<td><b>email utente</b></td>
<td><b>targa CP</b></td>
<td><b>tempo partenza</b></td>
<td><b>tempo arrivo</b></td>
</tr><%
	ArrayList<Tragitto_CP> listatCP = new ArrayList<Tragitto_CP>();
	listatCP = (ArrayList<Tragitto_CP>) session.getAttribute("lista_tragitti");
	for (Tragitto_CP tcp : listatCP) {%>
				<tr>
					<td><%=tcp.getFumatori()%></td>
					<td><%=tcp.getNum_posti()%></td>
					<td><%=tcp.getNote()%></td>
					<td><%=tcp.getCitta_partenza()%></td>
					<td><%=tcp.getProvincia_partenza()%></td>
					<td><%=tcp.getCitta_arrivo()%></td>
					<td><%=tcp.getProvincia_arrivo()%></td>
					<td><%=tcp.getEmail_utente()%></td>
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
    <div id="footer">
    </div>
</body>
</html>
    