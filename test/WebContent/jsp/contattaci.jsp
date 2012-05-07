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
    <title>Contattaci | Car+</title>
</head>

<body>
    
    <%= HTMLManager.getHeader(session) %>
    
    <div id="content">
        <div class="wrapper">
         <h1>Contattaci</h1>
         <p>Per informazioni chimare il numero verde 800.800.800 - attivo 24 ore su 24.</p>
         <p>Oppure inviare una mail a <a href="mailto:info@carplus.com">Servizio Clienti</a></p>
         </br>
         <p>Per ulteriori informazioni sul team di sviluppo del progetto, clicca <a href="about.jsp">qui</a>.</p>
        <div id="about"></div>
         <div style="clear: both;"></div>
        </div>
    </div>
    <div id="footer">
    </div>
</body>

</html>