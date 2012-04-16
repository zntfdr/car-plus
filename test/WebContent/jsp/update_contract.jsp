<%@ page import="Store.StoreContratto"%>
<%@ page import="Entita.Contratto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
		response.sendRedirect("login.jsp");
	} else {
	Contratto cntr = Store.StoreContratto.readContratto(Integer.parseInt((String) request.getParameter("id")));
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Aggiorna il contratto | Car+</title>
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
        <form method="GET" action="../UpdateContratto" id="new_subscription">
            <ul>
                <li><h1>Aggiorna Contratto</h1></li>
                <li><input name="id" type="hidden" id="id" value="<%= cntr.getId() %>"/></li>
                <li><input name="data_stipula" type="text" id="data_stipula" value="<%= Utils.TimeString.dataCalendarToString(cntr.getData_stipula()) %>" placeholder="Data Stipula"/></li>
                <li><input name="data_scadenza" type="text" id="data_scadenza" value="<%= Utils.TimeString.dataCalendarToString(cntr.getData_scadenza()) %>" placeholder="Data Scadenza"/></li>
                <li>
                	<select name="email_cliente">
	                	<option>Seleziona email utente..</option>
	                	<% for(String A : Interrogazione.ListaUtenti()){%>
	                	<option value="<%= A %>" <% if( cntr.getEmail_cliente().equals(A)) { %>selected="selected" <% } %>><%= A %></option> <% } %>
	                </select>
	            </li>
	            <li>
                	<select name="nome_abbonamento">
	                	<option>Seleziona abbonamento..</option>
	                	<% for(String A : Interrogazione.ListaAbbonamenti()){%>
	                	<option value="<%= A %>" <% if( cntr.getNome_abbonamento().equals(A)) { %>selected="selected" <% } %>><%= A %></option> <% } %>
	                </select>
	            </li>
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