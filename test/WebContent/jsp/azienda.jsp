<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="../css/base.css" type="text/css" rel="stylesheet" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <title>Azienda | Il nuovo servizio di Car Pooling</title>
</head>

<body>
    
    <%= HTMLManager.getHeader(session) %>
    
    <div id="content">
        <div class="wrapper">
        <ul>
        	<li><a href="../jsp/lista_abbonamenti.jsp">Visualizzazione abbonamenti</a></li>
        	<li>Numero utenti registrati:
        	<% int n = Interrogazione.Numero_Utenti_Registrati();  %>
        	<%=n %></li>
        </ul>
        <div style="clear: both;"></div>
    
        </div>
    </div>
    <div id="footer">
    </div>
</body>

</html>
