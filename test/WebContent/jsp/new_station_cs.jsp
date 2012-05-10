<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import="Store.StoreLocalita" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else {
	ArrayList<String> listaProvincia = StoreLocalita.getProvincia();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Nuova Stazione di Car Sharing | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $("#num_places").keypress(function(e){
            if(e.which < 48 || e.which > 57) return false;
            return true;
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
        <form method="POST" action="../Inserimento_stazione_cs" id="Inserimento_stazione_cs">
            <ul>
                <li><h1>Nuova Stazione di Car Sharing</h1></li>
                <li><label for="nome">Nome Stazione:</label><input name="nome" type="text" id="nome" placeholder="Nome Stazione"/></li>
                <li id="li_provincia">
	                <label for="provincia">Provincia:</label>
	                <select name="provincia" id="provincia">
						<option>Seleziona provincia..</option>
	     				<% for(String P : listaProvincia){%> <option value="<%= P %>"><%= P %></option> <% } %>
	      			</select>
	      		</li>
                <li><label for="address">Indirizzo:</label><input name="address" type="text" id="address" placeholder="Indirizzo"/></li>
                <li><label for="num_place">Numero Posti:</label><input name="num_places" type="text" id="num_places" placeholder="Numero posti"/></li>
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
<% } %>