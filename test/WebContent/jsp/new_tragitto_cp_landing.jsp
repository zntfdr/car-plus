<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Tragitto_CP" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione nuovo Tragitto avvenuta con successo!</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="header">
        <ul>
            <li><img src="../img/logo.png" alt="Logo"/></li>
            <li><a href="index.html">Home</a></li>
            <li><a href="#">id</a></li>
            <li><a href="#">Servizi</a></li>
           <li> <a href="#">Contattaci</a></li>
            <li><a href="login.html">Login</a></li>
        </ul>
    </div>
    <div id="content">
<div class="wrapper">
    <table id="trip_list">
      <tr>
        <td><b>fumatori</b></td>
<td><b>num_posti</b></td>
<td><b>note</b></td>
<td><b>citta_partenza</b></td>
<td><b>provincia_partenza</b></td>
<td><b>citta_arrivo</b></td>
<td><b>provincia_arrivo</b></td>
<td><b>email_utente</b></td>
<td><b>targa_CP</b></td>
<td><b>tempo_partenza</b></td>
<td><b>tempo_arrivo</b></td>
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
					<td><%=tcp.getTempo_partenza().get(Calendar.YEAR)+ "-" + tcp.getTempo_partenza().get(Calendar.MONTH + 1)+ "-" + tcp.getTempo_partenza().DAY_OF_MONTH + " " +tcp.getTempo_partenza().get(Calendar.HOUR)+ ":" + tcp.getTempo_partenza().get(Calendar.MINUTE)%></td>
					<td><%=tcp.getTempo_arrivo().get(Calendar.YEAR)+ "-" + tcp.getTempo_arrivo().get(Calendar.MONTH + 1)+ "-" + tcp.getTempo_arrivo().DAY_OF_MONTH + " " +tcp.getTempo_arrivo().get(Calendar.HOUR)+ ":" + tcp.getTempo_arrivo().get(Calendar.MINUTE)%></td>
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
    