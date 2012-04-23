<%@page import="Utils.TimeString"%>
<%@ page contentType="text/html" %>
<%@ page import="Entita.Tragitto_CP" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Utils.TimeString" %>
<%@ page import="Entita.Utente" %>    
<%@ page import = "Utils.HTMLManager" %>

<% Utente user = (Utente) session.getAttribute("utente_loggato"); %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Risultati Ricerca Tragitto CP | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>

<body>
	
	<%= HTMLManager.getHeader(session) %>
	
    <div id="content">
        <div class="wrapper">
        <% if(session.getAttribute("descrizione") != null) { %><%= session.getAttribute("descrizione") %><% session.removeAttribute("descrizione");} %>
        <table id="trip_list">
            <tr>
                <th>Citta Partenza</th>
                <th>Citta Arrivo</th>
                <th>Partenza</th>
                <th class="free">Posti Liberi</th>
                <th>Proprietario Auto</th>
                <th>+</th>
            </tr>
              <% ArrayList<Tragitto_CP> listaCP= new ArrayList<Tragitto_CP>();
                listaCP = (ArrayList<Tragitto_CP>) session.getAttribute("listaTragitti_CP");
                if(listaCP == null || listaCP.isEmpty()){
                	//non fare nulla
                }else {
                	for(Tragitto_CP T : listaCP){
                	session.setAttribute("tragitto"+T.getId(), T);%>
            <tr>
                <td class="from"> <%= T.getCitta_partenza() %></td>
                <td class="to"> <%= T.getCitta_arrivo() %></td>
                <td class="date"> <%= Utils.TimeString.dataOraCalendarToString(T.getTempo_partenza()) %></td>
                <td class="free"> <%= T.getNum_posti() %></td>
                <td class="to"> <%= T.getEmail_utente() %></td>
                <td><a href="show_partecipazione.jsp?tragittoscelto=tragitto<%=T.getId() %>" ><img src="../img/lens.png" width="18" height="18"/></a></td>
            </tr>
            <% }} %>
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
