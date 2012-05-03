<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="Entita.Utente" %>    
<%@ page import = "Utils.HTMLManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Store.StoreLocalita" %>
<%@ page import="Entita.Tragitto_CP" %>
<% ArrayList<String> listaProvincia = StoreLocalita.getProvincia(); %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ricerca un Tragitto | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script>
        $(document).ready(function() {
        	$("select#fromProv").change(function(e){
            	if ($("li#li_citta_from")) {
            		$("li#li_citta_from").remove();
            	}
            	var province = $(this).val();
            	var url = "../GetCittaAJAX?provincia=" + province;
            	if (province != "") {
    	        	$.get(url, function(data){
    			        			var li_citta = '<li id="li_citta_from">' + data + '</li>';
    			        			$(li_citta).insertAfter("li#li_provincia_from");
    			        			$("li#li_citta_from > select").attr("name", "from");
    			        			$("li#li_citta_from > select").attr("id", "from");
    			    });
            	}
            });
        	$("select#toProv").change(function(e){
        	if ($("li#li_citta_to")) {
        		$("li#li_citta_to").remove();
        	}
        	var province = $(this).val();
        	var url = "../GetCittaAJAX?provincia=" + province;
        	if (province != "") {
            	$.get(url, function(data){
    		        			var li_citta = '<li id="li_citta_to">' + data + '</li>';
    		        			$(li_citta).insertAfter("li#li_provincia_to");
    		        			$("li#li_citta_to > select").attr("name", "to");
    		        			$("li#li_citta_to > select").attr("id", "to");
    		    });
        	}
        });
            
            $("button#submit").click(function(e) {
                if ( ($("input#from").val() == "") && ($("input#to").val() == "") ) {
                    alert("Non puoi lasciare vuoti i campi di ricerca! Inseriscine almeno uno!");
                    return false;
                }
                return true;
            });
            
            $("input#date").datepicker({ dateFormat: 'yy/mm/dd' });
            $("input#date").datepicker("option", $.datepicker.regional[ "it" ] );
			
			$("input#people").keypress(function(e) {
                if(e.which < 48 || e.which > 57) return false;
				return true;
            });
        });
    </script>
</head>

<body>
	
	<%= HTMLManager.getHeader(session) %>
	
    <div id="content">
        <div class="wrapper">
        <form method="get" action="../RicercaTragitto_CP">
            <ul>
                <li><h1>Ricerca il tragitto perfetto per te!</h1></li>
                <fieldset>
                	<legend>Partenza:</legend>
	                <li id="li_provincia_from">
	                	<label for="fromProv">Provincia Partenza:</label>
		                <select name="fromProv" id="fromProv">
							<option>Seleziona provincia di partenza..</option>
		     				<% for(String P : listaProvincia){%> <option value="<%= P %>"><%= P %></option> <% } %>
		      			</select>
	      			</li>
	      		</fieldset>
	      		<fieldset>
	      			<legend>Arrivo:</legend>
	      			 <li id="li_provincia_to">
	                	<label for="toProv">Provincia Arrivo:</label>
		                <select name="toProv" id="toProv">
							<option>Seleziona provincia di arrivo..</option>
		     				<% for(String P : listaProvincia){%> <option value="<%= P %>"><%= P %></option> <% } %>
		      			</select>
	      			</li>
      			</fieldset>
      			<fieldset>
      				<legend>Altre informazioni:</legend>
	                <li><label for="date">Data:</label><input name="date" type="text" id="date" /></li>
	                <li><label for="people">Quante persone:</label><input name="people" type="text" id="people" maxlength="2"/></li>
                </fieldset>
                <li><button name="submit" type="submit" id="submit">Cerca</button></li>
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
