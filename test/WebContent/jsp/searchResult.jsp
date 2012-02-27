<%@ page contentType="text/html" %>
<%@ page import="Entita.Tragitto_CP" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ricerca un Tragitto | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
    
    
    
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="header">
        <ul>
            <li><a href="index.jsp"><img src="img/logo.png" alt="Logo"/></a></li>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
            <li><a href="#">Contattaci</a></li>
            <li><a href="login.html">Login</a></li>
        </ul>
    </div>
    <div id="content">
        <div class="wrapper">
        <table id="trip_list">
            <tr>
                <th>Partenza</th>
                <th>Arrivo</th>
                <th>Data</th>
                <th class="free">Posti</th>
                <th></th>
            </tr>
              <% ArrayList<Tragitto_CP> listaCP= new ArrayList<Tragitto_CP>();
                listaCP = (ArrayList<Tragitto_CP>) session.getAttribute("listaTragitti_CP");
                for(Tragitto_CP T : listaCP){%>
            <tr>
                <td class="from"> <%= T.getLocalita_partenza() %></td>
                <td class="to"> <%= T.getLocalita_arrivo() %></td>
                <td class="date"> <%= T.getCu_utente() %></td>
                <td class="free"> <%= T.getNum_posti() %></td>
                <td><a href="#"><img src="../img/lens.png" width="18" height="18"/></a></td>
            </tr>
            <% } %>
        </table>
        
        <div style="clear: both;"></div>
    	
        </div>
    </div>
    <div id="footer">
    	<div class="wrapper">
        </div>
    </div>
</body>
</html>
