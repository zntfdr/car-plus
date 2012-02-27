<%@ page contentType="text/html" %>
<%@ page import="Entita.Utente" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ricerca un Tragitto | Car+</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js" ></script>
    
    
    
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="header">
        <ul>
            <li><a href="file:///Macintosh HD/Users/Gianmarco/Sites"><img src="img/logo.png" alt="Logo"/></a></li>
            <li><a href="index.html">Home</a></li>
            <li><a href="#">Azienda</a></li>
            <li><a href="#">Servizi</a></li>
            <li><a href="#">Contattaci</a></li>
            <li><a href="login.html">Login</a></li>
        </ul>
    </div>
    <div id="content">
        <div class="wrapper">
        <table id="trip_list">
            <tr>
                <th>Nome</th>
                <th>Cognome</th>
                <th>Email</th>
                <th class="free">Password</th>
                <th></th>
            </tr>
            <% Utente ut = null;
            ut = (Utente) session.getAttribute("utente"); %>
             <tr>
             <td> <%= ut.getId_localita() %></td>
             <td> <%= ut.getCognome() %></td>
           <td> <%= ut.getEmail() %></td>
            <td> <%= ut.getPassword() %></td>
        </tr>
        </table>
        
        <div style="clear: both;"></div>
    	
        </div>
    </div>
    <div id="footer">
    	<div class="wrapper">
        </div>
    </div>
</body>
</html>
