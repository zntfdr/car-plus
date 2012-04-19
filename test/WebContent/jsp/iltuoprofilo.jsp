<%@page import="Store.StoreUtente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import="Entita.Utente" %>
<%@ page import="Entita.Utente.Type" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato"); //utente che modifica il suo profilo
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
            <ul>
               <fieldset>
                <legend>Informazioni Personali:</legend>
	                <li><input name="name" type="text" id="name" placeholder="Nome" Value="<%= user.getNome() %>" maxlength="30"/></li>
	                <li><input name="surname" type="text" id="surname" placeholder="cognome" Value="<%= user.getCognome() %>" maxlength="30"/></li>
	                <li><input name="sesso" type="text" id="sesso" placeholder="Sesso" Value="<%= user.getSesso() %>" maxlength="30"/></li> </li>
	                <li><input name="address" type="text" id="address" placeholder="Indirizzo" Value="<%= user.getIndirizzo() %>" maxlength="50"/></li>
	                <li><input name="provincia" type="text" id="provincia" placeholder="Provincia" Value="<%= user.getProvincia() %>" maxlength="50"/></li>
	                <li><input name="citta" type="text" id="citta" placeholder="Città" Value="<%= user.getCitta() %>" maxlength="50"/></li>
	                <li><input name="phone" type="text" id="phone" placeholder="Telefono" Value="<%= user.getTelefono() %>" maxlength="15"/></li>
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
