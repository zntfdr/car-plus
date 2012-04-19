<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Utils.HTMLManager" %>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../css/base.css" type="text/css" rel="stylesheet" />
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <title>About | Car+</title>
</head>

<body>
    
    <%= HTMLManager.getHeader(session) %>
    
    <div id="content">
        <div class="wrapper">
        <h1>Car+</h1>
        Car+ è un progetto universitario dell'<a href="http://www.unipd.it/">Università di Padova</a>, dipartimento di <a href="http://www.dei.unipd.it">Ingegneria dell'Informazione</a>
        <div id="announce"></div>
        
        <div style="clear: both;"></div>
        </div>
    </div>
    <div id="footer">
    </div>
</body>

</html>