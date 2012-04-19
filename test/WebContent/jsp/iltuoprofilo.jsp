<%@page import="Store.StoreUtente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import="Entita.Utente" %>
<%@ page import="Entita.Utente.Type" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato");
if (user == null) { //Controllo che sia aperta una connessione, altrimenti faccio il redirect a login.jsp
	response.sendRedirect("login.jsp");
} else {
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Il tuo profilo:</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js" ></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
</head>
<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <form id="register">
            <ul>
               <fieldset>
                <legend>Informazioni Personali:</legend>
	                <li><input name="name" type="text" id="name" placeholder="Nome" readonly="readnly" Value="<%= user.getNome() %>" maxlength="30"/></li>
	                <li><input name="surname" type="text" id="surname" placeholder="cognome" readonly="readnly" Value="<%= user.getCognome() %>" maxlength="30"/></li>
	                <li>
                	<div id="radio">
                	    <% if(user.getSesso().compareTo("M") == 0) { %> <input type="radio" id="radio1" name="radio" value="M" checked="checked"/><label for="radio1">Maschio</label>
                	    <% }else { %> <input type="radio" id="radio2" name="radio" value="F"checked="checked" /><label for="radio2">Femmina</label> <% } %>
                    </div>
				    </li>
	                <li><input name="address" type="text" id="address" placeholder="Indirizzo" readonly="readnly" Value="<%= user.getIndirizzo() %>" maxlength="50"/></li>
	                <li><input name="provincia" type="text" id="provincia" placeholder="Provincia" readonly="readnly" Value="<%= user.getProvincia() %>" maxlength="50"/></li>
	                <li><input name="citta" type="text" id="citta" placeholder="Città" readonly="readnly" Value="<%= user.getCitta() %>" maxlength="50"/></li>
	                <li><input name="phone" type="text" id="phone" placeholder="Telefono" readonly="readnly" Value="<%= user.getTelefono() %>" maxlength="15"/></li>
                </fieldset>
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
<%}%>