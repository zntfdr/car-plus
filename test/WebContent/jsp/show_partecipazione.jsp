<%@ page contentType="text/html" %>
<%@ page import="Utils.TimeString"%>
<%@ page import="Entita.Tragitto_CP" %>
<%@ page import="Entita.Utente" %>    
<% Utente user = (Utente) session.getAttribute("utente_loggato"); %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ricerca un Tragitto | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
    
    
    
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="header">
        <ul>
            <li><a href="../jsp/index.jsp"><img src="../img/logo.png" alt="Logo"/></a></li>
            <li><a href="../jsp/index.jsp">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
            <li><a href="#">Contattaci</a></li>
            <li><a href="../html/login.html">Login</a></li>
        </ul>
    </div>
    <div id="content">
        <div class="wrapper">
        Benvenuto <b><%= user.getNome() %></b>,<br/>
        <table id="trip_list">
            <tr>
            	<th>Descrizione</th>
            	<th>Fumatori</th>
                <th>Citta Partenza</th>
                <th>Provincia Partenza</th>
                <th>Citta Arrivo</th>
                <th>Provincia Arrivo</th>
                <th>Partenza</th>
                <th>Posti Liberi</th>
                <th>Proprietario Auto</th>
            </tr>
              <% Tragitto_CP T = (Tragitto_CP)session.getAttribute("tragitto_scelto");%>
            <tr>
            	<td class="to"> <%= T.getNote() %></td>
            	<td class="to"> <%= T.getFumatori() %></td>
                <td class="from"> <%= T.getCitta_partenza() %></td>
                <td class="from"> <%= T.getProvincia_partenza() %></td>                
                <td class="to"> <%= T.getCitta_arrivo() %></td>
                <td class="to"> <%= T.getProvincia_arrivo() %></td>
                <td class="date"> <%= Utils.TimeString.dataOraCalendarToString(T.getTempo_partenza()) %></td>
                <td class="free"> <%= T.getNum_posti() %></td>
                <td class="to"> <%= T.getEmail_utente() %></td>
            </tr>
        </table>
        
        <form method="get" action="../Inserimento_partecipazione" id="search">
            <ul>
            <li>Confermi?</li>
                Utente: <input name="user" readonly="readonly" type="text" id="user" value="<%=user.getEmail() %>" />
                Numero Posti: <input name="num_posti" readonly="readonly" type="text" id="num_posti" value="<%= (Integer)session.getAttribute("num_posti")%>"/>
                <input name="id" type="hidden" id="id" value="<%=T.getId()%>"/>
 				<li><button name="submit" type="submit" id="submit">Si</button></li>
            </ul>
        </form>
        
        <div style="clear: both;"></div>
    	
        </div>
    </div>
    <div id="footer">
    	<div class="wrapper">
        </div>
    </div>
</body>
</html>