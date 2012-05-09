<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.*" %>
<%@ page import="Store.StoreLocalita" %>
<%@ page import="Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>

<% Utente user = (Utente) session.getAttribute("utente_loggato"); %>
<%	if (user == null) {
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

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.js" ></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../css/jquery-ui-timepicker-addon.js" ></script>
<script>
    $(document).ready(function(){
    	$("select#fromprovince").change(function(e){
        	if ($("li#li_citta_from")) {
        		$("li#li_citta_from").remove();
        	}
        	var province = $(this).val();
        	var url = "../GetCittaAJAX?provincia=" + province;
        	if (province != "") {
	        	$.get(url, function(data){
			        			var li_citta = '<li id="li_citta_from">' + data + '</li>';
			        			$(li_citta).insertAfter("li#li_provincia_from");
			        			$("li#li_citta_from > select").attr("name", "fromcity");
			        			$("li#li_citta_from > select").attr("id", "fromcity");
			    });
        	}
        });
    	$("select#toprovince").change(function(e){
    	if ($("li#li_citta_to")) {
    		$("li#li_citta_to").remove();
    	}
    	var province = $(this).val();
    	var url = "../GetCittaAJAX?provincia=" + province;
    	if (province != "") {
        	$.get(url, function(data){
		        			var li_citta = '<li id="li_citta_to">' + data + '</li>';
		        			$(li_citta).insertAfter("li#li_provincia_to");
		        			$("li#li_citta_to > select").attr("name", "tocity");
		        			$("li#li_citta_to > select").attr("id", "tocity");
		    });
    	}
    });
    	$("#radio").buttonset();
        $("#numero_posti").keypress(function(e){
            if(e.which < 48 || e.which > 57) return false;
            return true;
        });

        $("#tempo_partenza, #tempo_arrivo").datetimepicker({ dateFormat: 'yy-mm-dd' });
        //$("#tempo_partenza, #tempo_arrivo").datetimepicker("option", $.datepicker.regional[ "it" ] );
    });
</script>
</head>

<body>
	
	<%= HTMLManager.getHeader(session) %>
	
	<% ArrayList<String> listaProvincia = StoreLocalita.getProvincia(); %>
	<% ArrayList<Macchina_CP> lista_targhe = Interrogazione.ListaMacchineUtente(user.getEmail()); %>
	<% String targa = (String)session.getAttribute("targa"); %>
	<% Modello_Macchina modello; %>
	<% Boolean macchina_creata = (Boolean)session.getAttribute("macchina_creata"); %>
	
    <div id="content">
        <div class="wrapper">
        <form method="POST" action="../Inserimento_tragitto_cp" id="Inserimento_tragitto_cp">
            <ul>
                <li><h1>Inserimento nuova tragitto di Car Pooling</h1></li>
                <fieldset>
                <legend>Informazioni Vettura:</legend>
	                <li class="hide"><input name="email_utente" type="hidden" id="email_utente" value="<%= user.getEmail() %>"/></li>
	                <% if (macchina_creata == null || macchina_creata.booleanValue() ==false){ %>
	                <li>
	                	<label for="carplate">Targa:</label>
	                		<select name="carplate">
	               			<option>Seleziona la macchina che utilizzerai..</option>
	                		<% for(Macchina_CP A : lista_targhe){ %> 
	                			<option value="<%= A.getTarga() %>">
	                		<% modello = Interrogazione.ModelloMacchina(A.getTarga());%>
	                <%= modello.getMarca() %><%= modello.getModello() %> <%= modello.getCilindrata() %>cc, anno <%= modello.getAnno() %>, Targa: <%= A.getTarga() %></option> <% } %>
	                </select></li>
	                <%} else{ modello = (Modello_Macchina)session.getAttribute("modello_macchina_cp"); %>
	                <li><input name="carplate" type="hidden" id="carplate" value="<%= targa %>"/></li>
	                <li><label for="info">Informazioni:</label><input name="info" type="text" readonly ="readonly" id="info" value="<%= modello.getMarca() %> <%= modello.getModello() %> <%= modello.getCilindrata() %>cc, anno <%= modello.getAnno() %>, Targa: <%= targa %>" /></li>
	                <%} %></li>
	                <li>Oppure <a href="../jsp/new_inserimento_macchina_cp.jsp">inserisci un nuova macchina</a>!</li>
	                
	                <li>
	                	<div id="radio">
	                        <input type="radio" id="radio1" name="smokers" /><label for="radio1">Fumatore</label>
	                        <input type="radio" id="radio2" name="smokers" checked="checked" /><label for="radio2">Non Fumatore</label>
	                    </div> 
	                </li>
	                <li style="clear:both">
	                	<label for="numero_posti"># Posti:</label>
	                	<input name="numero_posti" type="text" id="numero_posti" placeholder="Numero di posti disponibili"/>
	               	</li>
	                <li><label for="commento">Commento:</label><textarea name="commento" id="commento" rows="10" cols="60" placeholder="commento"></textarea>
	                </li>
                </fieldset>
                <fieldset>
                	<legend>Informazioni Viaggio:</legend>
                	<li id="li_provincia_from">
	                	<label for="fromprovince">Provincia Partenza:</label>
		                <select name="fromprovince" id="fromprovince">
							<option>Seleziona provincia di partenza..</option>
		     				<% for(String P : listaProvincia){%> <option value="<%= P %>"><%= P %></option> <% } %>
		      			</select>
	      			</li>
	      			 <li id="li_provincia_to">
	                	<label for="toprovince">Provincia Arrivo:</label>
		                <select name="toprovince" id="toprovince">
							<option>Seleziona provincia di arrivo..</option>
		     				<% for(String P : listaProvincia){%> <option value="<%= P %>"><%= P %></option> <% } %>
		      			</select>
	      			</li>
	                <li><label for="tempo_partenza">Orario di Partenza:</label><input name="tempo_partenza" type="text" id="tempo_partenza" placeholder="Orario di Partenza"/></li>
               		<li><label for="tempo_arrivo">Orario di Arrivo:</label><input name="tempo_arrivo" type="text" id="tempo_arrivo" placeholder="Orario di Arrivo"/></li>  
                </fieldset>
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
<% } %>