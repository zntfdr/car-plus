<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Entita.Utente" %>
<%@ page import = "Utils.HTMLManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrazione effettuata! | Car+</title>
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
        <h1><%= session.getAttribute("descrizione") %></h1>
        <table>
            <tr>
                <th>Nome</th>
                <th>Cognome</th>
                <th>Email</th>
            </tr>
            <% Utente ut = (Utente) session.getAttribute("utente"); %>
            <tr>
            	<td> <%= ut.getNome() %></td> 
            	<td> <%= ut.getCognome() %></td>
           		<td> <%= ut.getEmail() %></td>
	        </tr>
        </table>
        Ora <a href="../jsp/login.jsp">loggati</a>!
        <div style="clear: both;"></div>
        </div>
    </div>
    <div id="footer">
    	<div class="wrapper">
        </div>
    </div>
</body>
</html>
<% session.invalidate(); %>