<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else { %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Nuova Cliente | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<style>
	.selected{
		background-color: #FFF;
	}
</style>
<script>
    $(document).ready(function(){
    	$("input#codice_fiscale")
			.keypress(function(e){
				if ((e.which != 0) && (e.which != 8)){
					var cf_length = $("input#codice_fiscale").val().length;
					if (cf_length < 16) {
						if ((e.which >= 48) && (e.which <= 57)) {
								
								$("input#codice_fiscale").val(
									$("input#codice_fiscale").val() + String.fromCharCode(e.which)
								);
						} else if ((e.which >= 97) && (e.which <= 122)) {
								
								$("input#codice_fiscale").val(
									$("input#codice_fiscale").val() + String.fromCharCode(e.which-32)
								);
						} else if ((e.which >= 65) && (e.which <= 90)) {
							
								$("input#codice_fiscale").val(
									$("input#codice_fiscale").val() + String.fromCharCode(e.which)
								);
						}
					}
					
					return false;
				}
			})
			.keydown(function(e){
				if((e.which == 8) || (e.which == 46) || ((e.which >= 37) && (e.which <= 40))) {
					return true;
				}
			})
	     .focusin(function(){
			 	$(this).removeClass("error");
		 })
		 .focusout(function(){
				 if ($("input#codice_fiscale").val() != "") {
					var pattern = /[A-Z][A-Z][A-Z][A-Z][A-Z][A-Z][0-9][0-9][A-Z][0-9][0-9][A-Z][0-9][0-9][0-9][A-Z]/
		         	if (!pattern.test($("input#codice_fiscale").val())){
		         		alert("Il formato del codice fiscale non è valido. Ricontrolla!");
		         		$("input#codice_fiscale").addClass("error");
		         	} 
				 }
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
	
	<%= HTMLManager.getHeader(session) %>
	
    <%
    	String error_type = request.getParameter("error");
    	String customer_type = request.getParameter("customer_type");
    	Boolean isBusiness = (customer_type != null) ? (new Boolean(customer_type.compareToIgnoreCase("business") == 0)) : null;
    	Boolean error_exist =  (error_type != null) ? (new Boolean(error_type.compareToIgnoreCase("1") == 0)) : null;
    %>
    <div id="content">
        <div class="wrapper">
        <ul id="customer_type_navigation">
            <li id="normal_customer" class="<%= (((isBusiness != null) && (!isBusiness.booleanValue()))  || (isBusiness == null)) ? "selected" : ""%>">Cliente</li>
            <li id="business_customer" class="<%= ((isBusiness != null) && (isBusiness.booleanValue())) ? "selected" : ""%>">Cliente Business</li>
        </ul>
        <form method="post" action="../Inserimento_cliente" id="new_customer" class="<%= ((isBusiness != null) && isBusiness.booleanValue()) ? "hide" : ""%>">
            <ul>
                <li><h1>Nuovo Cliente</h1></li>
                <li>
                	<label for="email">Mail:</label>
                	<select name="email">
	                	<option>Seleziona email utente..</option>
	                	<% for(String A : Interrogazione.ListaUtentiNonClienti()){%> <option value="<%= A %>"><%= A %></option> <% } %>
	                </select>
	            </li>
                <li><label for="codice_fiscale">Codice Fiscale:</label><input name="codice_fiscale" type="text" id="codice_fiscale" placeholder="Codice Fiscale" maxlenght="16" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (!isBusiness.booleanValue())) ? "error" : "" %>"  value="<%=((error_exist != null) && error_exist.booleanValue() && (session.getAttribute("error_mail") != null)) ? session.getAttribute("error_cf") : "" %>"/></li>

                <li><button name="submit" type="submit" id="submit">Registra Cliente</button></li>
            </ul>
        </form>
        
        <form method="post" action="../Inserimento_cliente" id="new_business_customer" class="<%= (((isBusiness != null) && !isBusiness.booleanValue()  || (isBusiness == null))) ? "hide" : ""%>">
            <ul>
                <li><h1>Nuovo Cliente Business</h1></li>
                <li>
                	<label for="email">Mail:</label>
                	<select name="email">
	                	<option>Seleziona email utente..</option>
	                	<% for(String A : Interrogazione.ListaClientiNonClientiBusiness()){%> <option value="<%= A %>"><%= A %></option> <% } %>
	                </select>
	            </li>
                <li><label for="partita_iva">Partita IVA:</label><input name="partita_iva" type="text" id="partita_iva" placeholder="Partita Iva" maxlength="11" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (isBusiness.booleanValue())) ? "error" : "" %>"   value="<%=((error_exist != null) && error_exist.booleanValue() && (session.getAttribute("error_bu_pi") != null)) ? session.getAttribute("error_bu_pi") : "" %>"/></li>
                <li><label for="nome_attivita">Nome Attivit&agrave;:</label><input name="nome_attivita" type="text" id="nome_attivita" placeholder="Nome Attività" maxlength="50" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (isBusiness.booleanValue())) ? "error" : "" %>"   value="<%=((error_exist != null) && error_exist.booleanValue() && (session.getAttribute("error_bu_na") != null)) ? session.getAttribute("error_bu_na") : "" %>"/></li>

                <li><button name="submit_business" type="submit" id="submit">Registra Cliente Business</button></li>
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