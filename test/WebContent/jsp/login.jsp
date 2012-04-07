<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "Utils.HTMLManager" %>
<%
	String error_type = request.getParameter("error");
	Boolean error = (error_type != null) ? (new Boolean(error_type.compareToIgnoreCase("1") == 0)) : null;
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#username, #password").focus(function(){
			if($(this).hasClass("error")) {
				$(this).removeClass("error");
			}
		});
	});
</script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <form method="POST" action="../Login" id="login">
            <ul>
                <li><h1>Login</h1></li>
                <li><input name="username" type="text" id="username" placeholder="Username" class="<%= (error != null) && (error.booleanValue()) ? "error" : "" %>"/></li>
                <li><input name="password" type="password" id="password" placeholder="Password" class="<%= (error != null) && (error.booleanValue()) ? "error" : "" %>"/></li>
                <%= (error != null) && (error.booleanValue()) ? "<li class=\"error_message\">email o password errati! Riprova</li>" : "" %>
                
                <li><button name="submit" type="submit" id="submit">Login</button></li>
                ..oppure <a href="../jsp/register.jsp">registrati</a>!
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