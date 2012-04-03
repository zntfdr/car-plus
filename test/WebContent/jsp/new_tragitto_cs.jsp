<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.*" %>
<%@ page import="Servlet.Interrogazione" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato"); %>
<% ArrayList<Macchina_CS> listaMacchine = (ArrayList<Macchina_CS>) session.getAttribute("listaMacchine"); %>
<% ArrayList<Tessera> listaTessere = (ArrayList<Tessera>) session.getAttribute("listaTessere"); %>
<% Contratto contratto = (Contratto)session.getAttribute("contratto"); %>
<% Modello_Macchina modello; %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Inserimento nuovo tragitto di Car pooling | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script type="text/javascript" src="../css/jquery-ui-timepicker-addon.js" ></script>
<script>
    $(document).ready(function(){
    	 $("#radio").buttonset();
        $("#numero_posti").keypress(function(e){
            if(e.keyCode < 48 || e.keyCode > 57) return false;
            return true;
        });

        $("#tempo_partenza, #tempo_arrivo").datetimepicker({ dateFormat: 'yy-mm-dd' });
        //$("#tempo_partenza, #tempo_arrivo").datetimepicker("option", $.datepicker.regional[ "it" ] );
    });
</script>
</head>

<body>
	<div id="header">
        <ul>
            <li><a href="../html/index.html"><img src="../img/logo.png" alt="Logo"/></a></li>
            <li><a href="../html/index.html">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
            <li><a href="#">Contattaci</a></li>
            <li><a href="login.html">Login</a></li>
        </ul>
    </div>
    <div id="content">
        <div class="wrapper">
        <form method="GET" action="../Inserimento_tragitto_cp" id="Inserimento_tragitto_cp">
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
	                <%= modello.getMarca() %><%= modello.getModello() %> <%= modello.getCilindrata() %>cc, anno <%= modello.getAnno() %>, Targa: <%= A.getTarga() %></option> <% } %>
	                </select></li>
	            </fieldset>
                <li><button name="submit" type="submit" id="submit">Prenota</button></li>
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