<%@ page import="Entita.Tragitto_CS" %>
<%@ page import="Store.StoreTragitto_CS" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
		response.sendRedirect("login.jsp");
	} else {
	int id = Integer.parseInt(request.getParameter("id"));
	Tragitto_CS tcs = StoreTragitto_CS.readTragitto_CS(id);
	%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Computer di bordo | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js" ></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
	<script type="text/javascript" src="../css/jquery-ui-timepicker-addon.js" ></script>
	<script>
    	$(document).ready(function(){
	    	$("#tempo_prelievo, #tempo_consegna").datetimepicker({ dateFormat: 'yy-mm-dd' });
    	});
    </script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
       
        <form method="POST" action="../ComputerDiBordo" id="register">
            <ul>
                <li><h1>Computer di bordo per tragitto <%= tcs.getId() %></h1></li>
                <li class="hide"><input name="id" type="hidden" id="id" value="<%= tcs.getId() %>"/></li>
                <li><label for="km_totali">Chilometri effettuati:</label><input name="km_totali" type="text" id="km_totali" value="0" placeholder="Chilometri effettuati"/></li>
                <li><label for="tempo_prelievo">Tempo di Prelievo:</label><input name="tempo_prelievo" type="text" id="tempo_prelievo" value="<%=Utils.TimeString.dataOraCalendarToString(tcs.getTempo_prelievo_prenotazione()).replaceAll("(.*):00", "$1").replaceAll("/", "-") %>" placeholder="Tempo Prelievo"/></li>
				<li><label for="tempo_consegna">Tempo di Consegna:</label><input name="tempo_consegna" type="text" id="tempo_consegna" value="<%=Utils.TimeString.dataOraCalendarToString(tcs.getTempo_consegna_prenotazione()).replaceAll("(.*):00", "$1").replaceAll("/", "-") %>" placeholder="Tempo Consegna"/></li>                
				<li><button name="submit" type="submit" id="submit">Aggiorna</button></li>
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