<%@ page contentType="text/html" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="Utils.TimeString"%>
<%@ page import="Entita.Contratto" %>
<%@ page import="Entita.Utente" %>
<%@ page import="Store.StoreStazione_CS" %> 
<%@ page import="Entita.Localita" %> 
<%@ page import = "Utils.HTMLManager" %>
<% 	Utente user = (Utente) session.getAttribute("utente_loggato");
	if (user == null || user.getUserType()== Utente.Type.USER ) { //Controllo che sia aperta una connessione, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else {
	ArrayList<Contratto> listaContratti = (ArrayList<Contratto>)session.getAttribute("listaContratti");
	ArrayList<String> listaProvincia = StoreStazione_CS.getProvincia(); %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Scegli il tragitto di Car sharing | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.js" ></script>
<script type="text/javascript" src="../css/jquery-ui-timepicker-addon.js" ></script>
<script>
    $(document).ready(function(){
	    $("#tempoPrelievo, #tempoConsegna").datetimepicker({ dateFormat: 'yy-mm-dd' });
	    $("select#provincia_stazione").change(function(e){
        	if ($("li#li_citta_stazione")) {
        		$("li#li_citta_stazione").remove();
        	}
        	if ($("li#stations")) {
        		$("li#stations").remove();
        	}
        	var province = $(this).val();
        	var name = $(this).attr('name');
        	var url = "../Get_citta?provincia=" + province + "&selectName=" + name;
        	if (province != "") {
	        	$.get(url, function(data){
			        			var li_citta_stazione = '<li id="li_citta_stazione">' + data + '</li>';
			        			$(li_citta_stazione).insertAfter("li#li_provincia_stazione");
			        			$("select#citta_stazione").change(function(e){
			        				var city = $(this).val();
			        				var url_stations = "../Get_stazione?provincia="+province+"&citta="+city;
			        				$.get(url_stations, function(data){
			        					var li_stations = '<li id="stations">' + data + '</li>';
			        					$(li_stations).insertAfter("li#li_citta_stazione");
			        				});
			        			});
			        			
			    });
        	}
        });
    });
</script>
</head>

<body>
	
	<%= HTMLManager.getHeader(session) %>
	
    <div id="content">
        <div class="wrapper">
        Benvenuto <b><%= user.getNome() %></b>,<br/>
        Scegli un contratto da utilizzare per la prenotazione e la stazione di partenza:
        <form method="GET" action="../Inserimento_tragitto_cs_check" id="new_tragitto_cs_check">
	        <ul>
	        	<li>Prenota una macchina di Car Sharing</li>
	        	<fieldset>
	        		<legend>Scegli con quale contratto vuoi effettuare la prenotazione:</legend>
			        <li>
			        	<label for="contratto">Contratto:</label>
						<select name="contratto">
							<option>Seleziona contratto..</option>
			     			<% for(Contratto C : listaContratti){
			     			   Calendar now = Calendar.getInstance();
			     			   if (C.getData_scadenza().compareTo(now)>0){%> <option value="<%= C.getId() %>"><%= C.getNome_abbonamento() %></option> <% }} %>
			        	</select>
			        </li>
		        </fieldset>
		        <fieldset>
		        	<legend>Scegli il parcheggio da cui vuoi partire:</legend>
			        <li id="li_provincia_stazione">
			            <label for="provincia_stazione">Provincia:</label>
			            <select name="provincia_stazione" id="provincia_stazione">
							<option>Seleziona provincia stazione..</option>
			  				<% for(String P : listaProvincia){%> <option value="<%= P %>"><%= P %></option> <% } %>
			   			</select>
				    </li>
			    </fieldset>
			    <fieldset>
			    	<legend>Scegli l'orario per la prenotazione:</legend>
				    <li><label for="tempoPrelievo">Tempo di Prelievo:</label><input name="tempoPrelievo" type="text" id="tempoPrelievo" placeholder="Tempo Prelievo"/></li>
				    <li><label for="tempoConsegna">Tempo di Consegna:</label><input name="tempoConsegna" type="text" id="tempoConsegna" placeholder="Tempo Consegna"/></li>
				</fieldset>
		        <li><button name="submit" type="submit" id="submit">Prosegui</button></li>
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