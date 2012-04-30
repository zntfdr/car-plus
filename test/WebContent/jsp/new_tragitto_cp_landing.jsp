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
    <table>
      <tr>
        <th>Fumatori</th>
		<th># Posti</th>
		<th>Note</th>
		<th>Citt&agrave; Partenza</th>
		<th>Provincia Partenza</th>
		<th>Citt&agrave; Arrivo</th>
		<th>Provincia Arrivo</th>
		<th>Targa CP</th>
		<th>Tempo Partenza</th>
		<th>Tempo Arrivo</th>
	</tr>
<%
	ArrayList<Tragitto_CP> listatCP = new ArrayList<Tragitto_CP>();
	listatCP = (ArrayList<Tragitto_CP>) session.getAttribute("lista_tragitti");
	for (Tragitto_CP tcp : listatCP) {%>
				<tr>
					<td> <% if (tcp.getFumatori()){ %> &#10003;<% } 
                    else { %> &#10007;<% }  %></td>
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
    <div id="footer">
    </div>
</body>
</html>
    