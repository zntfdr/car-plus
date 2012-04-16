<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Stazione_CS" %>
<%@ page import="Entita.Modello_Macchina" %>
<%@ page import="Store.StoreStazione_CS" %>
<%@ page import="Store.StoreModello_Macchina" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {
	ArrayList<String> listaProvincia = StoreStazione_CS.getProvincia();
    ArrayList<Modello_Macchina> lista_mod_mac = StoreModello_Macchina.getModello_Macchina(); %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Inserimento nuova macchina di Car sharing | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script>
$(document).ready(function(){
        $("#purchase_year, #tot_km").keypress(function(e){
            if(e.keyCode < 48 || e.keyCode > 57) return false;
            return true;
        });

        $("#scadenza_bollo, #scadenza_assicurazione, #scadenza_revisione").datepicker({ dateFormat: 'yy/mm/dd' });
        $("#scadenza_bollo, #scadenza_assicurazione, #scadenza_revisione").datepicker("option", $.datepicker.regional[ "it" ] );
        
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
			        			var li_citta_stazione = '<li id="li_citta_stazione">' + data + '<input type="submit" id="get_stations" name="get_stations" /></li>';
			        			$(li_citta_stazione).insertAfter("li#li_provincia_stazione");
			        			$("input#get_stations").click(function(){
			        				var city = $("select#citta_stazione").val();
			        				var url_stations = "../Get_stazione?provincia="+province+"&citta="+city;
			        				$.get(url_stations, function(data){
			        					var li_stations = '<li id="stations">' + data + '</li>';
			        					$(li_stations).insertAfter("li#li_citta_stazione");
			        				});
			        				return false;
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
        <form method="GET" action="../Inserimento_macchina_cs" id="Inserimento_macchina_cs">
            <ul>
                <li><h1>Inserimento nuova macchina di Car sharing</h1></li>
                <fieldset>
                	<legend>Informazioni Automobile (1):</legend>
	                <li><input name="car_plate" type="text" id="car_plate" placeholder="Targa"/></li>
	                <li>
		                <select name="model">
			                <option>Nuovo modello..</option>
			                <% for(Modello_Macchina A : lista_mod_mac){%> <option value="<%= A.getId() %>"><%= A.getMarca() %> <%= A.getModello() %> <%= A.getAnno() %> alimentata a <%= A.getAlimentazione() %> <%= A.getCilindrata() %>cc</option> <% } %>
		                </select>
	                </li>
	            </fieldset>
	            <fieldset>
	            	<legend>Locazione Automobile:</legend>
	                <li id="li_provincia_stazione">
		                <select name="provincia_stazione" id="provincia_stazione">
							<option>Seleziona provincia stazione..</option>
		     				<% for(String P : listaProvincia){%> <option value="<%= P %>"><%= P %></option> <% } %>
		      			</select>
	      			</li>
                </fieldset>
                <fieldset>
                	<legend>Informazioni Automobile (2):</legend>
	                <li><input name="purchase_year" type="text" id="purchase_year" placeholder="Anno di Acquisto"/></li>
	                <li><input name="scadenza_bollo" type="text" id="scadenza_bollo" placeholder="Data di Scadenza Bollo"/></li>
	                <li><input name="scadenza_assicurazione" type="text" id="scadenza_assicurazione" placeholder="Data di Scadenza Assicurazione"/></li>
	                <li><input name="scadenza_revisione" type="text" id="scadenza_revisione" placeholder="Data di Scadenza Revisione"/></li>
	
	                <li><input name="tot_km" type="text" id="tot_km" placeholder="Km Totali"/></li>
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