<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Utils.TimeString"%>
<%@ page import="Entita.Tragitto_CP" %>
<%@ page import="Entita.Utente" %>    
<%@ page import = "Utils.HTMLManager" %>
<% 	Tragitto_CP T = (Tragitto_CP)session.getAttribute(request.getParameter("tragittoscelto"));
	Utente user = (Utente) session.getAttribute("utente_loggato"); 
	if (user == null) { //Controllo che sia aperta una connessione, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else { %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ricerca un Tragitto | Car+</title>
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
        
        <ul id="description">
        	<li><h1>Descrizione Viaggio:</h1></li>
        	<li><span class="label">Citt&agrave; Partenza:</span><%= T.getCitta_partenza() %></li>
        	<li><span class="label">Provincia Partenza:</span><%= T.getProvincia_partenza() %></li>
        	<li><span class="label">Citt&agrave; Arrivo:</span><%= T.getCitta_arrivo() %></li>
        	<li><span class="label">Provincia Arrivo:</span><%= T.getProvincia_arrivo() %></li>
        	<li><span class="label">Partenza:</span><%= Utils.TimeString.dataOraCalendarToString(T.getTempo_partenza()) %></li>
        	<li><span class="label">Fumatori:</span><% if (T.getFumatori()){ %> &#10003;<% } else { %> &#10007;<% }  %></li>
        	<li><span class="label">Posti Liberi:</span><%= T.getNum_posti() %></li>
        	<li><span class="label">Proprietario:</span><%= T.getEmail_utente() %></li>
        	<li><span class="label">Descrizione:</span><%= T.getNote() %></li>
        	
        </ul>
 
        <form method="POST" action="../Inserimento_partecipazione">
            <ul>
	            <li>Vuoi confermare la prenotazione?</li>
	            <li><strong>Utente:</strong> <%=user.getEmail() %> <input class="hide" name="user" readonly="readonly" type="text" id="user" value="<%=user.getEmail() %>" /></li>
	            <li><strong>Numero Posti:</strong> <%= (Integer)session.getAttribute("num_posti") %><input class="hide" name="num_posti" readonly="readonly" type="text" id="num_posti" value="<%= (Integer)session.getAttribute("num_posti")%>"/></li>
	                <input class="hide" name="id" type="hidden" id="id" value="<%=T.getId()%>"/>
	 			<li><button name="submit" type="submit" id="submit">S&igrave;</button><a href="javascript:history.go(-1)" class="no_button">No</a></li>
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
<% } %>