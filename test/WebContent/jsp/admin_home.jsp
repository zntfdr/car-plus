<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Servlet.Interrogazione" %>
<%@ page import = "Utils.HTMLManager" %>
<%	if (session.getAttribute("ADMIN") == null) {
	response.sendRedirect("login.jsp");
} else { %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="../css/base.css" type="text/css" rel="stylesheet" />
    <title>Car+ | Il nuovo servizio di Car Pooling</title>
</head>

<body>
    
    <%= HTMLManager.getHeader(session) %>
    
    <div id="content">
        <div class="wrapper">
        Benvenuto amministratore,<br/>
        scegli l'azione desiderata:
        <ul>
        	<li>Inserimento/Visualizzazione/Modifica/Cancellazione Stazioni Car Sharing</li>
        	<li><a href="../jsp/new_car_cs.jsp">Inserimento</a>/Visualizzazione/Modifica/Cancellazione Stazioni Macchine Sharing</li>
        	<li><a href="../html/new_car_model.html"></a>Inserimento/Visualizzazione/Modifica/Cancellazione Modelli Macchina</li>
        	<li>Inserimento/Visualizzazione/Modifica/Cancellazione Stazioni Utenti</li>
        	<li><a href="../jsp/new_customer.jsp">Inserimento</a>/Visualizzazione/Modifica/Cancellazione Clienti/Clienti Business</li>
        	<li><a href="../jsp/new_subscription.jsp"></a>Inserimento</a>/Visualizzazione/Modifica/Cancellazione Stazioni Abbonamenti</li>
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
<% } %>

