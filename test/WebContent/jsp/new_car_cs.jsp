<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.Stazione_CS" %>
<%@ page import="Entita.Modello_Macchina" %>
<%@ page import="Store.StoreStazione_CS" %>
<%@ page import="Store.StoreModello_Macchina" %>
<% ArrayList<Stazione_CS> lista_stazioni = StoreStazione_CS.getStazione_CS(); %>
<% ArrayList<Modello_Macchina> lista_mod_mac = StoreModello_Macchina.getModello_Macchina(); %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Inserimento nuova macchina di Car sharing | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
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
        <form method="GET" action="../Inserimento_macchina_cs" id="Inserimento_macchina_cs">
            <ul>
                <li><h1>Inserimento nuova macchina di Car sharing</h1></li>
                <li><input name="car_plate" type="text" id="car_plate" placeholder="Targa"/></li>
                <li>
                <select name="model">
                <option>Nuovo modello..</option>
                <% for(Modello_Macchina A : lista_mod_mac){%> <option value="<%= A.getId() %>"><%= A.getMarca() %> <%= A.getModello() %> <%= A.getAnno() %> alimentata a <%= A.getAlimentazione() %> <%= A.getCilindrata() %>cc</option> <% } %>
                </select>
                </li>
                <li>
                <select name="name_cs">
                <% for(Stazione_CS A : lista_stazioni){%> <option value="<%= A.getNome() %>"><%= A.getNome() %></option> <% } %>
                </select>
                <li>
                <select name="city">
                <% for(Stazione_CS A : lista_stazioni){%> <option value="<%= A.getCitta() %>"><%= A.getCitta() %></option> <% } %>
                </select>
                <select name="province">
     			<% for(Stazione_CS A : lista_stazioni){%> <option value="<%= A.getProvincia() %>"><%= A.getProvincia() %></option> <% } %>
                </select>
                <li><input name="purchase_year" type="text" id="purchase_year" placeholder="Anno di Acquisto"/></li>
                <li><input name="scadenza_bollo" type="text" id="scadenza_bollo" placeholder="Data di Scadenza Bollo"/></li>
                <li><input name="scadenza_assicurazione" type="text" id="scadenza_assicurazione" placeholder="Data di Scadenza Assicurazione"/></li>
                <li><input name="scadenza_revisione" type="text" id="scadenza_revisione" placeholder="Data di Scadenza Revisione"/></li>

                <li><input name="tot_km" type="text" id="tot_km" placeholder="Km Totali"/></li>

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