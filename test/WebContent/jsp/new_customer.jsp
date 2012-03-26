<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Nuova Cliente | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script>
    $(document).ready(function(){
        $("#codice_fiscale").keypress(function(e){
            if ((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 65 && e.keyCode <= 90)) { 
            	return true;
            };
            return false;
        });
        
        $("ul#customer_type_navigation li").click(function(e){
            if(e.target.id == "normal_customer"){
                if(!$(e.target).hasClass("selected")){
                     $("ul#customer_type_navigation li#business_customer").removeClass("selected");
                     $("ul#customer_type_navigation li#normal_customer").addClass("selected");
                     $("form#new_business_customer").slideUp('slow', function(){$("form#new_customer").slideDown('slow');});
                     
                } else { return false; }
            } else {
                if(!$(e.target).hasClass("selected")){
                     $("ul#customer_type_navigation li#business_customer").addClass("selected");
                     $("ul#customer_type_navigation li#normal_customer").removeClass("selected");
                     
                     $("form#new_customer").slideUp('slow', function(){$("form#new_business_customer").slideDown('slow');});
                } else { return false; }
            }
        });
    });
</script>
</head>

<body>
	<div id="header">
        <ul>
            <li><a href="index.html"><img src="../img/logo.png" alt="Logo"/></a></li>
            <li><a href="index.html">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
            <li><a href="#">Contattaci</a></li>
            <li><a href="login.html">Login</a></li>
        </ul>
    </div>
    <%
    	String error_type = request.getParameter("error");
    	String customer_type = request.getParameter("customer_type");
    	Boolean isBusiness = (customer_type != null) ? (new Boolean(customer_type.compareToIgnoreCase("business") == 0)) : null;
    	Boolean error_exist =  (error_type != null) ? (new Boolean(error_type.compareToIgnoreCase("1") == 0)) : null;
    %>
    <div id="content">
        <div class="wrapper">
        <ul id="customer_type_navigation">
            <li id="normal_customer" class="<%= ((isBusiness != null) && (!isBusiness.booleanValue())) ? "selected" : ""%>">Cliente</li>
            <li id="business_customer" class="<%= ((isBusiness != null) && (isBusiness.booleanValue())) ? "selected" : ""%>">Cliente Business</li>
        </ul>
        <form method="post" action="../Inserimento_cliente" id="new_customer" class="<%= (isBusiness.booleanValue()) ? "hide" : ""%>">
            <ul>
                <li><h1>Nuovo Cliente</h1></li>
                <li><input name="email" type="text" id="email" placeholder="Mail" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (!isBusiness.booleanValue())) ? "error" : "" %>"/></li>
                <li><input name="codice_fiscale" type="text" id="codice_fiscale" placeholder="Codice Fiscale" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (!isBusiness.booleanValue())) ? "error" : "" %>"/></li>

                <li><button name="submit" type="submit" id="submit">Registra</button></li>
            </ul>
        </form>
        
        <form method="post" action="../Inserimento_cliente" id="new_business_customer" class="<%= (!isBusiness.booleanValue()) ? "hide" : ""%>">
            <ul>
                <li><h1>Nuovo Cliente Business</h1></li>
                <li><input name="email" type="text" id="email" placeholder="Mail" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (isBusiness.booleanValue())) ? "error" : "" %>"/></li>
                <li><input name="partita_iva" type="text" id="partita_iva" placeholder="Partita Iva" maxlength="11" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (isBusiness.booleanValue())) ? "error" : "" %>"/></li>
                <li><input name="nome_attivita" type="text" id="nome_attivita" placeholder="Nome Attività" maxlength="50" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (isBusiness.booleanValue())) ? "error" : "" %>"/></li>

                <li><button name="submit_business" type="submit" id="submit_business">Registra</button></li>
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