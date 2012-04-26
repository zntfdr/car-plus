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
			var li = $("ul#admin_navigation > li");
    		
    		var li_width = li.width();
    		var li_height = li.height();
    		
    		$("ul#admin_navigation ul").css({top: -li_height, left: li_width+5});
    		$("ul#admin_navigation > li").hover(function(){
									    			$(this).find("ul").show();
									    		}, 
									    		function(){
									    			$(this).find("ul").hide();
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
        	<li><a href="#">Gestione Contratti</a>
        		<ul>
        			<li><a href="../jsp/new_contract.jsp" class="inserisci">Inserisci</a></li>
        			<li><a href="../jsp/lista_contratti.jsp" class="visualizza">Visualizza</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Tessere</a>
        		<ul>
        			<li><a href="../jsp/associaTesseraStep1.jsp" class="inserisci">Inserisci</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Località</a>
        		<ul>
        			<li><a href="../jsp/new_place.jsp" class="inserisci">Inserisci</a></li>
        			<li><a href="../jsp/lista_localita.jsp" class="visualizza">Visualizza</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Pagamenti</a>
        		<ul>
        			<li><a href="../jsp/pagamenti.jsp" class="inserisci">Registra Pagamento</a></li>
        		</ul>
        	</li>
        	<li><a href="#">Gestione Tragitti Car Sharing</a>
        		<ul>
        			<li><a href="../jsp/lista_TragittiCsinfo.jsp" class="inserisci">Visualizza</a></li>
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