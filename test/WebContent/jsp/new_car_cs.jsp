<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            if(e.which < 48 || e.which > 57) return false;
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
	        	$.post(url, function(data){
			        			var li_citta_stazione = '<li id="li_citta_stazione">' + data + '</li>';
			        			$(li_citta_stazione).insertAfter("li#li_provincia_stazione");
			        			$("select#citta_stazione").change(function(e){
			        	    		if ($("li#stations")) {
			        	    			$("li#stations").remove();
			        	    		}
			        	    		
			        				var city = $(this).val();
			        				var url_stations = "../Get_stazione?provincia="+province+"&citta="+city;
			        				$.post(url_stations, function(data){
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
        <form method="POST" action="../Inserimento_macchina_cs" id="Inserimento_macchina_cs">
            <ul>
                <li><h1>Inserimento nuova macchina di Car sharing</h1></li>
                <fieldset>
                	<legend>Informazioni Automobile (1):</legend>
	                <li><label for="car_plate">Targa:</label><input name="car_plate" type="text" id="car_plate" placeholder="Targa"/></li>
	                <li>
		                <label for="model">Modello:</label><select name="model">
			                <option>Nuovo modello..</option>
			                <% for(Modello_Macchina A : lista_mod_mac){%> <option value="<%= A.getId() %>"><%= A.getMarca() %> <%= A.getModello() %> <%= A.getAnno() %> alimentata a <%= A.getAlimentazione() %> <%= A.getCilindrata() %>cc</option> <% } %>
		                </select>
	                </li>
	            </fieldset>
	            <fieldset>
	            	<legend>Locazione Automobile:</legend>
	                <li id="li_provincia_stazione">
		                <label for="provincia_stazione">Provincia:</label>
		                <select name="provincia_stazione" id="provincia_stazione">
							<option>Seleziona provincia stazione..</option>
		     				<% for(String P : listaProvincia){%> <option value="<%= P %>"><%= P %></option> <% } %>
		      			</select>
	      			</li>
                </fieldset>
                <fieldset>
                	<legend>Informazioni Automobile (2):</legend>
	                <li><label for="purchase_year">Anno di Acquisto:</label><input name="purchase_year" type="text" id="purchase_year" placeholder="Anno di Acquisto"/></li>
	                <li><label for="scadenza_bollo">Scadenza Bollo:</label><input name="scadenza_bollo" type="text" id="scadenza_bollo" placeholder="Data di Scadenza Bollo"/></li>
	                <li><label for="scadenza_assicurazione">Scadenza Assicurazione:</label><input name="scadenza_assicurazione" type="text" id="scadenza_assicurazione" placeholder="Data di Scadenza Assicurazione"/></li>
	                <li><label for="scadenza_revisione">Scadenza Revisione:</label><input name="scadenza_revisione" type="text" id="scadenza_revisione" placeholder="Data di Scadenza Revisione"/></li>
	
	                <li><label for="tot_km">Km Totali:</label><input name="tot_km" type="text" id="tot_km" placeholder="Km Totali"/></li>
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