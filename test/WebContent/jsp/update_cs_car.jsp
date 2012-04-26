<%@ page import="Entita.Macchina_CS"%>
<%@ page import="Entita.Stazione_CS" %>
<%@ page import="Entita.Modello_Macchina" %>
<%@ page import="Store.StoreStazione_CS" %>
<%@ page import="Store.StoreModello_Macchina" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
		response.sendRedirect("login.jsp");
	} else {
	Macchina_CS macchina = Store.StoreMacchina_CS.readMacchina_CS(request.getParameter("targa"));
	ArrayList<Stazione_CS> lista_stazioni = StoreStazione_CS.getStazione_CS();
	ArrayList<Modello_Macchina> lista_mod_mac = StoreModello_Macchina.getModello_Macchina(); %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiorna la Macchina CS con targa <%= macchina.getTarga() %> | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js" ></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <script>
    $(document).ready(function(){
    	
    	$("select#province").change(function(e){
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
			    });
        	}
        });
    	
    	$("select#city").change(function(e){
    		if ($("li#stations")) {
    			$("li#stations").remove();
    		}
    		
			var city = $(this).val();
			var url_stations = "../Get_stazione?provincia="+province+"&citta="+city;
			$.get(url_stations, function(data){
				var li_stations = '<li id="stations">' + data + '</li>';
				$(li_stations).insertAfter("li#li_citta_stazione");
			});
				
    	});
    	
        $("#purchase_year, #tot_km").keypress(function(e){
            if(e.keyCode < 48 || e.keyCode > 57) return false;
            return true;
        });

        $("#scadenza_bollo, #scadenza_assicurazione, #scadenza_revisione").datepicker({ dateFormat: 'yy/mm/dd' });
        $("#scadenza_bollo, #scadenza_assicurazione, #scadenza_revisione").datepicker("option", $.datepicker.regional[ "it" ] );
        
    });
    </script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
       
        <form method="POST" action="../UpdateMacchinaCS" id="register">
            <ul>
                <li><h1>Aggiorna la Macchina CS con targa <%= macchina.getTarga() %></h1></li>
                <li class="hide"><input name="oldcar_plate" type="hidden" id="oldcar_plate" value="<%= macchina.getTarga() %>"/></li>
                <li><label for="car_plate">Targa:</label><input name="car_plate" type="text" id="car_plate" value="<%= macchina.getTarga() %>" placeholder="Targa"/></li>
                <li>
                <label for="model">Modello:</label>
                <select name="model"><% for(Modello_Macchina A : lista_mod_mac){%>
                	<option value="<%= A.getId() %>" <%if (A.getId() == macchina.getId_modello()) { %>selected="selected" <% } %>><%= A.getMarca() %> <%= A.getModello() %> <%= A.getAnno() %> alimentata a <%= A.getAlimentazione() %> <%= A.getCilindrata() %>cc</option> <% } %>
                </select>
                </li>
                <li id="li_provincia_stazione">
	                <label for="province">Provincia:</label>
	                <select name="province"><% for(Stazione_CS A : lista_stazioni){%>
	     				<option value="<%= A.getProvincia() %>" <% if (A.getProvincia().equals(macchina.getProvincia())) { %>selected="selected" <% } %>><%= A.getProvincia() %></option> <% } %>
	                </select>
                </li>
                <li id="li_citta_stazione">
	               <label for="city">Citt&agrave;</label>
	               <select name="city"><% for(Stazione_CS A : lista_stazioni){%>
	               	<option value="<%= A.getCitta() %>" <% if (A.getCitta().equals(macchina.getCitta())) { %>selected="selected" <% } %>><%= A.getCitta() %></option> <% } %>
	               </select>
                </li>
                <li id="stations">
	                <label for="name_cs">Nome Stazione:</label>
	                <select name="name_cs"><% for(Stazione_CS A : lista_stazioni){%>
	                	<option value="<%= A.getNome() %>" <% if(A.getNome().equals(macchina.getNome_stazione_CS())) { %>selected="selected" <% } %>><%= A.getNome() %></option> <% } %>
	                </select>
                </li>
                <li><label for="purchase_year">Anno di Acquisto:</label><input name="purchase_year" type="text" id="purchase_year" value="<%= macchina.getAnno_acquisto() %>" placeholder="Anno di Acquisto"/></li>
                <li><label for="scadenza_bollo">Scadenza Bollo:</label><input name="scadenza_bollo" type="text" id="scadenza_bollo" value="<%= Utils.TimeString.dataCalendarToString(macchina.getScad_bollo()) %>" placeholder="Data di Scadenza Bollo"/></li>
                <li><label for="scadenza_assicurazione">Scadenza Assicurazione:</label><input name="scadenza_assicurazione" type="text" id="scadenza_assicurazione" value="<%= Utils.TimeString.dataCalendarToString(macchina.getScad_assicurazione()) %>" placeholder="Data di Scadenza Assicurazione"/></li>
                <li><label for="scadenza_revisione">Scadenza Revisione:</label><input name="scadenza_revisione" type="text" id="scadenza_revisione" value="<%= Utils.TimeString.dataCalendarToString(macchina.getScad_revisione()) %>" placeholder="Data di Scadenza Revisione"/></li>

                <li><label for="tot_km">Totale Km:</label><input name="tot_km" type="text" id="tot_km" value="<%= macchina.getKm_totali() %>" placeholder="Km Totali"/></li>

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