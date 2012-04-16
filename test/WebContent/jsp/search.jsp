<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="Entita.Utente" %>    
<%@ page import = "Utils.HTMLManager" %>

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
            $("img#change_button").click(function(e) {
                var temp_from = $("input#from").val();
                $("input#from").val($("input#to").val());
                $("input#to").val(temp_from);
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
        <form method="get" action="../RicercaTragitto_CP" id="search">
            <ul>
                <li><h1>Ricerca il tragitto perfetto per te!</h1></li>
                <li><label for="fromProv">Provincia Partenza:</label><input name="fromProv" type="text" id="fromProv" /></li>
                <li><label for="from">Citta Partenza:</label><input name="from" type="text" id="from" /></li>
                <li><label for="toProv">Provincia Arrivo:</label><input name="toProv" type="text" id="toProv" /></li>
                <li><label for="to">Citta Arrivo:</label><input name="to" type="text" id="to" /></li>
                <li><label for="date">Data:</label><input name="date" type="datetime" id="date" /></li>
                <li><label for="people">Quante persone:</label><input name="people" type="text" id="people" maxlength="2"/></li>
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
