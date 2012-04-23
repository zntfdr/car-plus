<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entita.*" %>
<%@ page import="Entita.Utente.Type" %>
<%@ page import="Store.*" %>
<%@ page import="Utils.HTMLManager" %>
<% 
 ArrayList<Stazione_CS> lista_stazioni = StoreStazione_CS.getStazione_CS();
 ArrayList<Modello_Macchina> lista_mod_mac = StoreModello_Macchina.getModello_Macchina();
 Utente user = (Utente) session.getAttribute("utente_loggato");
	if ( user == null || ! ( user.getUserType() == Type.CLIENTE || user.getUserType() == Type.BUSINESS ) ) { //Controllo che sia aperta una connessione con un cliente, altrimenti faccio il redirect a login.jsp
		response.sendRedirect("login.jsp");
	} else {
	String temp;
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Visualizza il tuo conto con Car+ | Car+</title>
<link href="../css/base.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="../img/favicon.png" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.js" ></script>
</head>

<body>
	<%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <h1> Il tuo conto</h1>
         <% ArrayList<Tragitto_CS_info> listaTragitti = StoreTragitto_CS_info.readTragitto_CS_info_cliente(user.getEmail());
         double costoTotale = 0;%>
         <table id="trip_list">
      		<tr>
		        <td><b>Stazione tragitto</b></td>
		        <td><b>Tempo prelievo</b></td>
		        <td><b>Tempo consegna</b></td>
		        <td><b>Costo</b></td>
		        <td><b>Pagato</b></td>
      		</tr>
  			<% for(Tragitto_CS_info T : listaTragitti){
  				if(!T.getPagato()){
  					costoTotale += T.getCosto();
  				}
				if (!Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo()).equals("1111/11/11 00:00:00")) {
  			%>
      		<tr>
				<td><%= T.getNome() %></td>
				<td> <%=Utils.TimeString.dataOraCalendarToString(T.getTempo_prelievo()) %></td>
				<td> <%=Utils.TimeString.dataOraCalendarToString(T.getTempo_consegna())%></td>
				<td><%=T.getCosto()%> &euro;</td>
				<td><% if (T.getPagato()) { %> &#10003;<% 	} else { %> &#10007;<% 	} %></td>
			</tr>
		    <% } //fine if
		    } //fine for %>
    	</table>
    	<br>
    	Il tuo debito totale nei nostri confronti è di euro: <b><%= costoTotale %></b>
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