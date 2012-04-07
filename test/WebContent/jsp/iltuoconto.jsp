<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.*" %>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Store.*" %>
<%@ page import="Utils.HTMLManager" %>
<% 
 ArrayList<Stazione_CS> lista_stazioni = StoreStazione_CS.getStazione_CS();
 ArrayList<Modello_Macchina> lista_mod_mac = StoreModello_Macchina.getModello_Macchina();
 Utente user = (Utente) session.getAttribute("utente_loggato");
	if ( user == null || ! ( user.getUserType() == Type.CLIENTE || user.getUserType() == Type.BUSINESS ) ) { //Controllo che sia aperta una connessione con un cliente, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else {
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Visualizza il tuo conto con Car+ | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
         Nothing to see here, yet!
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