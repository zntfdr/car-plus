<%@ page import="Entita.Abbonamento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
		response.sendRedirect("login.jsp");
	} else {
	Abbonamento abb = Store.StoreAbbonamento.readAbbonamento(request.getParameter("nome"));  %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiorna l'abbonamento <%= abb.getNome() %> | Car+</title>
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
       
        <form method="POST" action="../UpdateAbbonamento" id="register">
            <ul>
                <li><h1>Aggiornamento Abbonamento</h1></li>
                <fieldset>
                	<legend>Informazioni Generali:</legend>
	                <li><label for="nome">Nome:</label><input name="nome" type="text" id="nome" readonly="readnly" value="<%= abb.getNome() %>"/></li>
	                <li><label for="descrizione">Descrizione:</label><input name="descrizione" type="text" id="descrizione" value="<%= abb.getDescrizione() %>" placeholder="Descrizione"/></li>
	            </fieldset>
	            <fieldset>
	            	<legend>Tariffe:</legend>
	                <li><label for="tariffa_min_100km">Tariffa < 100 Km</label><input name="tariffa_min_100km" type="text" id="tariffa_min_100km" value="<%= abb.getTariffa_min_100km() %>" placeholder="Tariffa per tratte < 100Km"/></li>
	                <li><label for="tariffa_magg_100km">Tariffa > 100 Km</label><input name="tariffa_magg_100km" type="text" id="tariffa_magg_100km" value="<%= abb.getTariffa_magg_100km() %>" placeholder="Tariffa per tratte > 100Km"/></li>
	                <li><label for="tariffa_diurna">Tariffa Diurna:</label><input name="tariffa_diurna" type="text" id="tariffa_diurna" value="<%= abb.getTariffa_diurna() %>" placeholder="Tariffa diurna"/></li>
	                <li><label for="tariffa_notturna">Tariffa Notturna:</label><input name="tariffa_notturna" type="text" id="tariffa_notturna" value="<%= abb.getTariffa_notturna() %>" placeholder="Tariffa notturna"/></li>
	                <li><label for="costo_mensile">Costo Mensile:</label><input name="costo_mensile" type="text" id="costo_mensile" value="<%= abb.getCosto_mensile() %>" placeholder="Costo mensile"/></li>
	            </fieldset>
	            <fieldset>
	            	<legend>Disponibilità Tessere:</legend>
	                <li><label for="num_min_tessere"># Minimo Tessere:</label><input name="num_min_tessere" type="text" id="num_min_tessere" value="<%= abb.getNum_min_tessere() %>" placeholder="Numero minimo di tessere"/></li>
	                <li><label for="num_max_tessere"># Massimo Tessere:</label><input name="num_max_tessere" type="text" id="num_max_tessere" value="<%= abb.getNum_max_tessere() %>" placeholder="Numero massimo di tessere"/></li>
	            </fieldset>                
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