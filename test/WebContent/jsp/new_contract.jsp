<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>

<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else { %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Nuovo Contratto | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script>
    $(document).ready(function(){
        $("#data_stipula, #data_scadenza").datepicker({ dateFormat: 'yy-mm-dd' });
    });
</script>
</head>
<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <form method="GET" action="../Inserimento_contratto" id="new_subscription">
            <ul>
                <li><h1>Nuovo Contratto</h1></li>
                <li><label for="data_stipula">Data Stipula:</label><input name="data_stipula" type="text" id="data_stipula" placeholder="Data Stipula"/></li>
                <li><label for="data_scadenza">Data Scadenza:</label><input name="data_scadenza" type="text" id="data_scadenza" placeholder="Data Scadenza"/></li>
                <li>
                	<label for="email_cliente">Mail Cliente:</label>
                	<select name="email_cliente">
	                	<option>Seleziona email utente..</option>
	                	<% for(String A : Interrogazione.ListaUtenti()){%>
	                	<option value="<%= A %>"><%= A %></option> <% } %>
	                </select>
	            </li>
	            <li>
	            	<label for="nome_abbonamento">Tipo Abbonamento:</label>
                	<select name="nome_abbonamento">
	                	<option>Seleziona abbonamento..</option>
	                	<% for(String A : Interrogazione.ListaAbbonamenti()){%>
	                	<option value="<%= A %>"><%= A %></option> <% } %>
	                </select>
	            </li>
                <li><button name="submit" type="submit" id="submit">Inserisci</button></li>
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