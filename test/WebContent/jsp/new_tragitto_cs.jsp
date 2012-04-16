<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.*" %>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<% 	ArrayList<Macchina_CS> listaMacchine = (ArrayList<Macchina_CS>) session.getAttribute("listaMacchine");
	ArrayList<Tessera> listaTessere = (ArrayList<Tessera>) session.getAttribute("listaTessere");
	Contratto contratto = (Contratto)session.getAttribute("contratto");
	Modello_Macchina modello;
	Utente user = (Utente) session.getAttribute("utente_loggato");
	if ( user == null || ! ( user.getUserType() == Type.CLIENTE || user.getUserType() == Type.BUSINESS ) ) { //Controllo che sia aperta una connessione con un cliente, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else {
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Inserimento nuovo tragitto di Car pooling | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script type="text/javascript" src="../css/jquery-ui-timepicker-addon.js" ></script>

</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <form method="GET" action="../Inserimento_tragitto_cs" id="Inserimento_tragitto_cs">
            <%if (listaMacchine.isEmpty()) { %>
            <div id="content">
            <div class="wrapper">
            Non ci sono macchine disponibili. <a href="../jsp/new_tragitto_cs_check.jsp">Riprova cambiando i campi di ricerca </a>
            <div style="clear: both;"></div>
            </div>
           </div>
            <% } else {%>
            
            <ul>
                <li><h1>Inserimento prenotazione Car Sharing</h1></li>
                <fieldset>
                <legend>Informazioni Cliente:</legend>
	                <li><input name="email_utente" type="hidden" id="email_utente" value="<%= user.getEmail() %>"/></li>
	                <li><input name="contrattoCliente" type="text" readonly="readnly" id="contrattoCliente" value="<%= contratto.getId() +"-"+ contratto.getNome_abbonamento()%>"/></li>
	                <li><select name="idTessera">
	                <option>Seleziona la tessera..</option>
	                <% for(Tessera T : listaTessere){%> <option value="<%= T.getId() %>"><%= T.getId() %></option> <% } %>
	                </select></li>
	               
                </fieldset>
                <fieldset>
                	<legend>Informazioni Vettura:</legend>
	                <li><select name="carplate">
	                <option>Seleziona la macchina che utilizzerai..</option>
	                <% for(Macchina_CS A : listaMacchine){%> <option value="<%= A.getTarga() %>">
	                <% modello = Interrogazione.ModelloMacchinaCS(A.getTarga());%>
	                Stazione: <%=A.getNome_stazione_CS() %> -- Modello macchina: <%= modello.getMarca() %> <%= modello.getModello() %> <%= modello.getCilindrata() %>cc, anno <%= modello.getAnno() %>, Targa: <%= A.getTarga() %></option> <% } %>
	                </select></li>
	            </fieldset>
                <li><button name="submit" type="submit" id="submit">Prenota</button></li>
            </ul>
            <%} %>
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