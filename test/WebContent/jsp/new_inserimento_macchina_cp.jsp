<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="Entita.*" %>
<%@ page import="Store.StoreModello_Macchina" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "Utils.HTMLManager" %>

<% ArrayList<Modello_Macchina> lista_mod_mac = StoreModello_Macchina.getModello_Macchina(); %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Nuovo modello macchina | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
<script>
    $(document).ready(function(){
        
        $("ul#solo_targa_o_anche_modello_navigation li").click(function(e){
            if(e.target.id == "solo_targa"){
                if(!$(e.target).hasClass("selected")){
                     $("ul#solo_targa_o_anche_modello_navigation li#anche_modello").removeClass("selected");
                     $("ul#solo_targa_o_anche_modello_navigation li#solo_targa").addClass("selected");
                     $("form#anche_modello").slideUp('slow', function(){$("form#solo_targa").slideDown('slow');});
                     
                } else { return false; }
            } else {
                if(!$(e.target).hasClass("selected")){
                     $("ul#solo_targa_o_anche_modello_navigation li#anche_modello").addClass("selected");
                     $("ul#solo_targa_o_anche_modello_navigation li#solo_targa").removeClass("selected");
                     
                     $("form#solo_targa").slideUp('slow', function(){$("form#anche_modello").slideDown('slow');});
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
    	String macchina_inserita = request.getParameter("macchina_inserita");
    	Boolean solotarga = (customer_type != null) ? (new Boolean(customer_type.compareToIgnoreCase("business") == 0)) : null;
    	Boolean error_exist =  (error_type != null) ? (new Boolean(error_type.compareToIgnoreCase("1") == 0)) : null;
    %>
    <div id="content">
        <div class="wrapper">
        <% if (macchina_inserita!=null && macchina_inserita.compareTo("ok")==0){ %>
        Ora scelgi il modello che hai appena inserito e completa il form inserendo anche la targa.
        <%} %> 
        <form method="post" action="../Inserimento_solo_targa" id="solo_targa" class="<%= ((solotarga != null) && solotarga.booleanValue()) ? "hide" : ""%>">
            <ul>
                <li><h1>Inserisci la tua nuova macchina</h1></li>
                <li><input name="targa" type="text" id="targa" placeholder="Targa"/></li>
                <li>
                <select name="model">
                	<option>Seleziona il modello..</option>
                	<% for(Modello_Macchina A : lista_mod_mac){%> <option value="<%= A.getId() %>"><%= A.getMarca() %> <%= A.getModello() %> <%= A.getAnno() %> alimentata a <%= A.getAlimentazione() %> <%= A.getCilindrata() %>cc</option> <% } %>
                </select>
                </li>
                <li><button name="submit" type="submit" id="submit">Registra</button></li>
            </ul>
        </form>

        <form method="post" action="../Inserimento_targa_e_modello" id="anche_modello" class="<%= (((solotarga != null) && !solotarga.booleanValue()  || (solotarga == null))) ? "hide" : ""%>">
            <ul>
                <li><h1>Nuovo Modello Macchina</h1></li>
                <li><input name="marca" type="text" id="marca" placeholder="Marca" maxlenght="30"/></li>
                <li><input name="modello" type="text" id="modello" placeholder="Modello" maxlength="50"/></li>
                <li><input name="cilindrata" type="text" id="cilindrata" placeholder="Cilindrata"/></li>
                <li><input name="anno" type="text" id="anno" placeholder="Anno" maxlenght="4"/></li>
                <li><select name="alimentazione">
                	<option value="Benzina">Benzina</option>
                	<option value="Diesel">Diesel</option>
                	<option value="GPL">GPL</option>
                	<option value="Metano">Metano</option>
                	<option value="Elettrica">Elettrica</option>
                </select></li>
                <li><input name="emissioni_co2" type="text" id="emissioni_co2" placeholder="Emissioni CO2 [g/km]"/></li>
                <li><input name="num_posti" type="text" id="num_posti" placeholder="Numero Posti"/></li>

                <li><button name="submit" type="submit" id="submit">Registra</button></li>
            </ul>
        </form>
        
        <ul id="solo_targa_o_anche_modello_navigation">
        C'è il modello che stai cercando?
            <li id="solo_targa" class="<%= (((solotarga != null) && (!solotarga.booleanValue()))  || (solotarga == null)) ? "selected" : ""%>">Sì</li>
            <li id="anche_modello" class="<%= ((solotarga != null) && (solotarga.booleanValue())) ? "selected" : ""%>">No</li>
        </ul>
        <div style="clear: both;"></div>
    	
        </div>
    </div>
    <div id="footer">
    	<div class="wrapper">
        </div>
    </div>
</body>
</html>