<%@page import="Store.StoreUtente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import="Entita.Utente" %>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Store.StoreLocalita" %>
<%@ page import="java.util.ArrayList" %>
<% Utente user;
	if (session.getAttribute("ADMIN") != null)	user = StoreUtente.readUtente(request.getParameter("email")); //amministratore che modifica un account
	else										user = (Utente) session.getAttribute("utente_loggato"); //utente che modifica il suo profilo
	
	if (user == null) { //Controllo che sia aperta una connessione, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else {
		ArrayList<String> listaProvincia = StoreLocalita.getProvincia();
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiorna <% if (session.getAttribute("ADMIN") != null) { %><%= "il profilo di " + user.getEmail() %><% } else { %>il tuo account<%}%> | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js" ></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <script>
        $(document).ready(function() {
            $("#radio").buttonset();
			
			$("button#submit").click(function(e) {
				$("div#error_modal").slideUp('slow').remove();
                var error = false;
				var missing = '';
				
				if ($("input#name").val() == "") {
					error = error || true;
					missing += 'nome, ';
				}
				
				if ($("input#surname").val() == "") {
					error = error || true;
					missing += 'cognome, ';
				}
				
				if ($("input#address").val() == "") {
					error = error || true;
					missing += 'indirizzo, ';
				}
				
				if ($("input#phone").val() == "") {
					error = error || true;
					missing += 'telefono, ';
				}
				
				if (error) {
					var modal_box =  '<div class="ui-widget" id="error_modal" ><div class="ui-state-error ui-corner-all"style="padding:30px;"> <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span> <strong>Attenzione:</strong>I campi '+ missing + ' non sono stati correttamente impostati! Riempi tutti i campi per completare la registrazione</p></div></div>';
					
					$("div#content > div.wrapper").prepend(modal_box);
					$(document).scrollTop();
					
					 return false;
				}
				
				if ($("input#password").val() != $("input#retype-password").val()) {
					var modal_box =  '<div class="ui-widget" id="error_modal" ><div class="ui-state-error ui-corner-all"style="padding:30px;"> <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span> <strong>Attenzione:</strong>Le password digitate non coincidono. Verificale per completare la registrazione!</p></div></div>';
					$("div#content > div.wrapper").prepend(modal_box);
					$(document).scrollTop();
					return false;
				}
				
				return true;
            });
			
			$("div#content input").click(function(e) {
                $("div#error_modal").slideUp('slow', function() {$("div#error_modal").remove();});
				
            });
			
			$("select#provincia").change(function(e){
	        	if ($("li#li_citta")) {
	        		$("li#li_citta").remove();
	        	}
	        	var province = $(this).val();
	        	var name = $(this).attr('name');
	        	var url = "../GetCittaAJAX?provincia=" + province;
	        	if (province != "") {
		        	$.post(url, function(data){
				        			var li_citta = '<li id="li_citta">' + data + '</li>';
				        			$(li_citta).insertAfter("li#li_provincia");
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
       
        <form method="POST" action="../UpdateUtente" id="register">
            <ul>
                <li><h1>Aggiornamento Account</h1></li>
                <fieldset>
                	<legend>Informazioni Account:</legend>
	                <li><label for="mail">Mail:</label><input name="mail" type="text" id="mail" readonly="readonly" value="<%= user.getEmail() %>" /></li>
	                <li><label for="password">Nuova Password:</label><input name="password" type="password" id="password" placeholder="Nuova Password"/></li>
	                <li><label for="retype-password">Ripeti Nuova Password:</label><input name="retype-password" type="password" id="retype-password" placeholder="Ripeti Password"/></li>
                </fieldset>
                <fieldset>
                <legend>Informazioni Personali:</legend>
	                <li><label for="name">Nome:</label><input name="name" type="text" id="name" placeholder="Nome" Value="<%= user.getNome() %>" maxlength="30"/></li>
	                <li><label for="surname">Cognome:</label><input name="surname" type="text" id="surname" placeholder="cognome" Value="<%= user.getCognome() %>" maxlength="30"/></li>
	                <li>
	                	<div id="radio" style="clear:both">
	                        <input type="radio" id="radio1" name="radio" value="M" <% if(user.getSesso().compareTo("M") == 0) { %> checked="checked" <% } %>/><label for="radio1">Maschio</label>
	                        <input type="radio" id="radio2" name="radio" value="F"<% if(user.getSesso().compareTo("F") == 0) { %> checked="checked" <% } %>/><label for="radio2">Femmina</label>
	                    </div>
					</li>
	                <li style="clear:both">
		                <label for="address">Indirizzo:</label>
		                <input name="address" type="text" id="address" placeholder="Indirizzo" Value="<%= user.getIndirizzo() %>" maxlength="50"/>
	                </li>
	                <li id="li_provincia">
		                <label for="provincia">Provincia:</label>
		                <select name="provincia" id="provincia">
							<option>Seleziona provincia..</option>
		     				<% for(String P : listaProvincia){%> <option value="<%= P %>" <%= user.getProvincia().compareTo(P) == 0 ? "selected=\"selected\"" : "" %>><%= P %></option> <% } %>
		      			</select>
	      			</li>
	      			
	      			<li id="li_citta">
	      				<label for="citta">Citt&agrave;:</label>
      					<select name="citta" id="citta">
      							<option>Seleziona Città..</option>
      						<%
      							ArrayList<String> listaCittaPerProvincia = StoreLocalita.getCitta(user.getProvincia());
      							for(String C : listaCittaPerProvincia) { %>
      								<option value = "<%= C %>" <%= user.getCitta().compareTo(C) == 0 ? "selected=\"selected\"" : "" %> ><%= C %></option>
      							<% } %>
      					</select>
	      			</li>
	                <li><label for="phone">Telefono:</label><input name="phone" type="text" id="phone" placeholder="Telefono" Value="<%= user.getTelefono() %>" maxlength="15"/></li>
                </fieldset>
                <li><button name="submit" type="submit" id="submit">Aggiorna il Profilo</button></li>
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