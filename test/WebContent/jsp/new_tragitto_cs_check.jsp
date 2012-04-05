<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Utils.TimeString"%>
<%@ page import="Entita.Contratto" %>
<%@ page import="Entita.Utente" %>
<%@ page import="Store.StoreLocalita" %> 
<%@ page import="Entita.Localita" %> 
<%@ page import = "Utils.HTMLManager" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato"); %>
<% ArrayList<Contratto> listaContratti = (ArrayList<Contratto>)session.getAttribute("listaContratti"); %>
<% ArrayList<Localita> listaLocalita = StoreLocalita.getLocalita(); %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scegli il contratto | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script type="text/javascript" src="../css/jquery-ui-timepicker-addon.js" ></script>
</head>

<body>
	
	<%= HTMLManager.getHeader(session) %>
	
    <div id="content">
        <div class="wrapper">
        Benvenuto <b><%= user.getNome() %></b>,<br/>
        Scegli un contratto da utilizzare per la prenotazione e la stazione di partenza:
        <form method="GET" action="../Inserimento_tragitto_cs_check" id="new_tragitto_cs_check">
        <select name="contratto">
				<option>Seleziona contratto..</option>
     			<% for(Contratto C : listaContratti){%> <option value="<%= C.getId() %>"><%= C.getNome_abbonamento() %></option> <% } %>
        </select><br/>
          <select name="provincia_stazione">
				<option>Seleziona provincia stazione..</option>
     			<% for(Localita P : listaLocalita){%> <option value="<%= P.getProvincia() %>"><%= P.getProvincia() %></option> <% } %>
        </select><br/>
        <select name="citta_stazione">
	                <option>Seleziona città stazione..</option>
	                <% for(Localita C : listaLocalita){%> <option value="<%= C.getCitta() %>"><%= C.getCitta() %></option> <% } %>
	    </select>
	    <input name="tempoPrelievo" type="text" id="tempoPrelievo" placeholder="Tempo Prelievo"/></li>
	    <input name="tempoConsegna" type="text" id="tempoConsegna" placeholder="Tempo Consegna"/></li>

        <button name="submit" type="submit" id="submit">Prosegui</button>
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