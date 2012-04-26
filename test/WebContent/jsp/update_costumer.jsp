<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import = "Store.*" %>
<%@ page import = "Entita.*" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else { %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Aggiorna Cliente | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script>
    $(document).ready(function(){
     
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
	<%= HTMLManager.getHeader(session) %>
    <%
    	String error_type = request.getParameter("error");
    	String customer_type = request.getParameter("customer_type");
    	Boolean isBusiness = (customer_type != null) ? (new Boolean(customer_type.compareToIgnoreCase("business") == 0)) : null;
    	Boolean error_exist =  (error_type != null) ? (new Boolean(error_type.compareToIgnoreCase("1") == 0)) : null;
    	
    	Cliente_business clienteB = StoreCliente_business.readCliente_business(request.getParameter("email"));
    	Cliente cliente = StoreCliente.readCliente(request.getParameter("email"));
    %>
    <div id="content">
        <div class="wrapper">
        <ul id="customer_type_navigation">
            <li id="normal_customer" class="<%= (((isBusiness != null) && (!isBusiness.booleanValue()))  || (isBusiness == null)) ? "selected" : ""%>">Cliente</li>
            <% if ( clienteB != null){ %><li id="business_customer" class="<%= ((isBusiness != null) && (isBusiness.booleanValue())) ? "selected" : ""%>">Cliente Business</li><% } %>
        </ul>
        <form method="post" action="../UpdateCliente" id="new_customer" class="<%= ((isBusiness != null) && isBusiness.booleanValue()) ? "hide" : ""%>">
            <ul>
                <li><h1>Aggiorna Cliente</h1></li>
                <li><label for="email">Mail:</label><input name="email" type="text" id="email" placeholder="Mail" readonly="readnly" value="<%= cliente.getEmail_utente() %>"/></li>
                <li><label for="codice_fiscale">Codice Fiscale:</label><input name="codice_fiscale" type="text" id="codice_fiscale" placeholder="Codice Fiscale" value="<%= cliente.getCodice_fiscale() %>" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (!isBusiness.booleanValue())) ? "error" : "" %>"  value="<%=((error_exist != null) && error_exist.booleanValue() && (session.getAttribute("error_mail") != null)) ? session.getAttribute("error_cf") : "" %>"/></li>
                <li><button name="submit" type="submit" id="submit">Aggiorna</button></li>
            </ul>
        </form>
        
        <% if (clienteB != null){ %>
        <form method="post" action="../UpdateCliente" id="new_business_customer" class="<%= (((isBusiness != null) && !isBusiness.booleanValue()  || (isBusiness == null))) ? "hide" : ""%>">
            <ul>
                <li><h1>Aggiorna Cliente Business</h1></li>
                <li><label for="email">Mail:</label><input name="email" type="text" id="email" placeholder="Mail" readonly="readnly" value="<%= clienteB.getEmail_utente() %>"/></li>
                <li><label for="partita_iva">Partita IVA:</label><input name="partita_iva" type="text" id="partita_iva" placeholder="Partita Iva" maxlength="11" value="<%= clienteB.getPartita_iva() %>" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (isBusiness.booleanValue())) ? "error" : "" %>"   value="<%=((error_exist != null) && error_exist.booleanValue() && (session.getAttribute("error_bu_pi") != null)) ? session.getAttribute("error_bu_pi") : "" %>"/></li>
                <li><label for="nome_attivita">Nome Attivit&agrave;</label><input name="nome_attivita" type="text" id="nome_attivita" placeholder="Nome Attività" maxlength="50" value="<%= clienteB.getNome_attivita() %>" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (isBusiness.booleanValue())) ? "error" : "" %>"   value="<%=((error_exist != null) && error_exist.booleanValue() && (session.getAttribute("error_bu_na") != null)) ? session.getAttribute("error_bu_na") : "" %>"/></li>
                <li><button name="submit_business" type="submit" id="submit_business">Aggiorna</button></li>
            </ul>
        </form><% } %>
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