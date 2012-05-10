<%@ page import="Entita.Stazione_CS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import="Store.StoreLocalita" %>
<%@ page import="java.util.ArrayList" %>
<%	if (session.getAttribute("ADMIN") == null) {
		response.sendRedirect("login.jsp");
	} else {
	Stazione_CS stazione = Store.StoreStazione_CS.readStazione_CS(request.getParameter("citta"), request.getParameter("provincia"), request.getParameter("nome"));
	ArrayList<String> listaProvincia = StoreLocalita.getProvincia();
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiorna la stazione <%= stazione.getNome() %> | Car+</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js" ></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <script>
	    $(document).ready(function(){
	        $("#num_places").keypress(function(e){
	            if(e.which < 48 || e.which > 57) return false;
	            return true;
	        });
	        $("select#province").change(function(e){
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
       
        <form method="POST" action="../UpdateStazioneCS" id="register">
            <ul>
                <li><h1>Aggiornamento della Stazione <%= stazione.getNome() %></h1></li>
                <!-- parametri da passare alla servlet per capire quale stazione aggiornare --> 
                <li class="hide"><input name="oldname" id="oldname" type="hidden" value="<%= stazione.getNome() %>" placeholder="Nome"/></li>
                <li class="hide"><input name="oldprovince" id="oldprovince" type="hidden" value="<%= stazione.getProvincia() %>" placeholder="Provincia"/></li>
                <li class="hide"><input name="oldcity" id="oldcity" type="hidden" value="<%= stazione.getCitta() %>" placeholder="Città"/></li>
                <!-- parametri da modificare --> 
                <li><label for="name">Nome Stazione:</label><input name="name" type="text" id="name" value="<%= stazione.getNome() %>" placeholder="Nome"/></li>
                <li><label for="address">Indirizzo:</label><input name="address" type="text" id="address" value="<%= stazione.getIndirizzo() %>" placeholder="Indirizzo"/></li>
                
                <li id="li_provincia">
	                <label for="province">Provincia:</label>
	                <select name="province" id="province">
						<option>Seleziona provincia..</option>
	     				<% for(String P : listaProvincia){%> <option value="<%= P %>" <%= stazione.getProvincia().compareTo(P) == 0 ? "selected=\"selected\"" : "" %>><%= P %></option> <% } %>
	      			</select>
      			</li>
	      			
      			<li id="li_citta">
      				<label for="city">Citt&agrave;:</label>
     					<select name="city" id="city">
     							<option>Seleziona Città..</option>
     						<%
     							ArrayList<String> listaCittaPerProvincia = StoreLocalita.getCitta(stazione.getProvincia());
     							for(String C : listaCittaPerProvincia) { %>
     								<option value = "<%= C %>" <%= stazione.getCitta().compareTo(C) == 0 ? "selected=\"selected\"" : "" %> ><%= C %></option>
     							<% } %>
     					</select>
      			</li>
                <li><label for="num_places">Numero Posti:</label><input name="num_places" type="text" id="num_places" value="<%= stazione.getNum_posti() %>" placeholder="Numero posti"/></li>
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