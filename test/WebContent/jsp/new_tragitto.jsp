<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.*" %>
<%@ page import="Store.StoreLocalita" %>
<%@ page import="Servlet.Interrogazione" %>
<% Utente user = (Utente) session.getAttribute("utente_loggato"); %>
<% ArrayList<Localita> lista_localita = StoreLocalita.getLocalita(); %>
<% ArrayList<Macchina_CP> lista_targhe = Interrogazione.ListaMacchineUtente(user.getEmail()); %>
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
<script>
    $(document).ready(function(){
        $("#numero_posti").keypress(function(e){
            if(e.keyCode < 48 || e.keyCode > 57) return false;
            return true;
        });

        $("#tempo_partenza, #tempo_arrivo").datepicker({ dateFormat: 'yy/mm/dd' });
        $("#tempo_partenza, #tempo_arrivo").datepicker("option", $.datepicker.regional[ "it" ] );
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
                <li><h1>Inserimento nuova tragitto di Car Pooling</h1></li>
                <li><input name="email_utente" type="hidden" id="email_utente" value="<%= user.getEmail() %>"/></li>
                <li><input name="smokers" type="checkbox" id="smokers"> Fumatori</li>
                <li><input name="numero_posti" type="text" id="numero_posti" placeholder="Numero di posti disponibili"/></li>
                <li><textarea name="commento" id="commento" rows="10" cols="60" placeholder="commento"></textarea>
                </li>
				<select name="fromprovince">
				<option>Seleziona provincia partenza..</option>
     			<% for(Localita A : lista_localita){%> <option value="<%= A.getProvincia() %>"><%= A.getProvincia() %></option> <% } %>
                </select><br/>
                <select name="fromcity">
                <option>Seleziona città partenza..</option>
                <% for(Localita A : lista_localita){%> <option value="<%= A.getCitta() %>"><%= A.getCitta() %></option> <% } %>
                </select><br/>
                <select name="toprovince">
				<option>Seleziona provincia arrivo..</option>
     			<% for(Localita A : lista_localita){%> <option value="<%= A.getProvincia() %>"><%= A.getProvincia() %></option> <% } %>
                </select><br/>
                <select name="tocity">
                <option>Seleziona città arrivo..</option>
                <% for(Localita A : lista_localita){%> <option value="<%= A.getCitta() %>"><%= A.getCitta() %></option> <% } %>
                </select><br/>
                <select name="carplate">
                <option>Seleziona la macchina che utilizzerai..</option>
                <% for(Macchina_CP A : lista_targhe){%> <option value="<%= A.getTarga() %>">
                <% modello = Interrogazione.ModelloMacchina(A.getTarga());%>
                <%= modello.getMarca() %><%= modello.getModello() %> <%= modello.getCilindrata() %>cc, anno <%= modello.getAnno() %>, Targa: <%= A.getTarga() %></option> <% } %>
                </select>
                <li><input name="tempo_partenza" type="text" id="tempo_partenza" placeholder="Tempo Partenza"/></li>
                <li><input name="tempo_arrivo" type="text" id="tempo_arrivo" placeholder="Tempo Arrivo"/></li>

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