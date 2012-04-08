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
                	<select name="email">
	                	<option>Seleziona email utente..</option>
	                	<% for(String A : Interrogazione.ListaUtentiNonClienti()){%> <option value="<%= A %>"><%= A %></option> <% } %>
	                </select>
	            </li>
                <li><input name="codice_fiscale" type="text" id="codice_fiscale" placeholder="Codice Fiscale" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (!isBusiness.booleanValue())) ? "error" : "" %>"  value="<%=((error_exist != null) && error_exist.booleanValue() && (session.getAttribute("error_mail") != null)) ? session.getAttribute("error_cf") : "" %>"/></li>

                <li><button name="submit" type="submit" id="submit">Registra Cliente</button></li>
            </ul>
        </form>
        
        <form method="post" action="../Inserimento_cliente" id="new_business_customer" class="<%= (((isBusiness != null) && !isBusiness.booleanValue()  || (isBusiness == null))) ? "hide" : ""%>">
            <ul>
                <li><h1>Nuovo Cliente Business</h1></li>
                <li>
                	<select name="email">
	                	<option>Seleziona email utente..</option>
	                	<% for(String A : Interrogazione.ListaClientiNonClientiBusiness()){%> <option value="<%= A %>"><%= A %></option> <% } %>
	                </select>
	            </li>
                <li><input name="partita_iva" type="text" id="partita_iva" placeholder="Partita Iva" maxlength="11" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (isBusiness.booleanValue())) ? "error" : "" %>"   value="<%=((error_exist != null) && error_exist.booleanValue() && (session.getAttribute("error_bu_pi") != null)) ? session.getAttribute("error_bu_pi") : "" %>"/></li>
                <li><input name="nome_attivita" type="text" id="nome_attivita" placeholder="Nome Attività" maxlength="50" class="<%= ((error_exist != null) && (error_exist.booleanValue()) && (isBusiness.booleanValue())) ? "error" : "" %>"   value="<%=((error_exist != null) && error_exist.booleanValue() && (session.getAttribute("error_bu_na") != null)) ? session.getAttribute("error_bu_na") : "" %>"/></li>

                <li><button name="submit_business" type="submit" id="submit_business">Registra Cliente Business</button></li>
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