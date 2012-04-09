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
    <link rel="icon" type="image/png" href="../img/favicon.png" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <title>Car+ | Il nuovo servizio di Car Pooling</title>
    
    <script>
    	$(document).ready(function(){
    		var menu_ul  = $("ul#admin_navigation > li > ul");
    		menu_ul.hide();
    		$(menu_ul.get(0)).show();
    		
    		$("ul#admin_navigation > li > a").click(function(e){
    			e.preventDefault();
    			if (!$(this).hasClass('active')) {
    				$("ul#admin_navigation > li > a").removeClass('active');
    				menu_ul.filter(':visible').slideUp('normal');
    				$(this).addClass('active').next().stop(true, true).slideDown('normal');
    			}
    		});
    	});
    </script>
    
</head>

<body>
    <%= HTMLManager.getHeader(session) %>
    <div id="content">
        <div class="wrapper">
        <h1>Benvenuto Amministratore, scegli cosa vuoi fare:</h1>
        <ul id="admin_navigation">
        	<li><a href="#">Gestione Stazioni di Car Sharing</a>
        		<ul>
        			<li><a href="../jsp/new_station_cs.jsp" class="inserisci">Inserisci</a></li>
        			<li><a href="../jsp/lista_stazioni_cs.jsp" class="visualizza">Visualizza</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Macchine di Car Sharing</a>
        		<ul>
        			<li><a href="../jsp/new_car_cs.jsp" class="inserisci">Inserisci</a></li>
        			<li><a href="../jsp/lista_macchine_cs.jsp" class="visualizza">Visualizza</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Modelli Macchine</a>
        		<ul>
        			<li><a href="../jsp/new_car_model.jsp" class="inserisci">Inserisci</a></li>
        			<li><a href="../jsp/lista_modelli_macchina.jsp" class="visualizza">Visualizza</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Utente</a>
        		<ul>
        			<li><a href="../jsp/register.jsp" class="inserisci">Inserisci</a></li>
        			<li><a href="../jsp/lista_utenti.jsp" class="visualizza">Visualizza</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Clienti</a>
        		<ul>
        			<li><a href="../jsp/new_customer.jsp" class="inserisci">Inserisci</a></li>
        			<li><a href="../jsp/lista_clienti.jsp" class="visualizza">Visualizza</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Abbonamenti</a>
        		<ul>
        			<li><a href="../jsp/new_subscription.jsp" class="inserisci">Inserisci</a></li>
        			<li><a href="../jsp/lista_abbonamenti.jsp" class="visualizza">Visualizza</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Località</a>
        		<ul>
        			<li><a href="../jsp/new_location.jsp" class="inserisci">Inserisci</a></li>
        			<li><a href="#" class="visualizza"><s>Visualizza</s></a></li>
        			<li><a href="#" class="modifica"><s>Modifica</s></a></li>
        			<li><a href="#" class="cancella"><s>Cancella</s></a></li>
        		</ul>
        	</li>
        </ul>
        <div style="clear: both;"></div>
    
        </div>
    </div>
    <div id="footer">
    </div>
</body>

</html>
<% } %>