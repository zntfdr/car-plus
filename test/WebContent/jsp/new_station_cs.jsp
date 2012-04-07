<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else { %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Nuova Stazione di Car Sharing | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $("#num_places").keypress(function(e){
            if(e.keyCode < 48 || e.keyCode > 57) return false;
            return true;
        });
    });
</script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <form method="GET" action="../Inserimento_stazione_cs" id="Inserimento_stazione_cs">
            <ul>
                <li><h1>Nuova Stazione di Car Sharing</h1></li>
                <li><input name="name" type="text" id="name" placeholder="Nome"/></li>
                <li><input name="city" type="text" id="city" placeholder="Città"/></li>
                <li><input name="province" type="text" id="province" placeholder="Provincia"/>
                    <!-- <select name="province">
                        <option value="VE">Venezia</option>
                        <option value="PD">Padova</option>
                        <option value="MI">Milano</option>
                    </select> -->
                </li>
                <li><input name="address" type="text" id="address" placeholder="Indirizzo"/></li>
                <li><input name="num_places" type="text" id="num_places" placeholder="Numero posti"/></li>
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