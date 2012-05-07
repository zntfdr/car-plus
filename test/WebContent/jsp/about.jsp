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
        Car+ è un progetto universitario per il corso di <a href="http://www.ing.unipd.it/index.php?page=Attivita&corso=IN0521&curr=000ZZ&attfor=1053277&ord=2009">Basi di Dati</a> presieduto dal Prof. <a href="http://ims.dei.unipd.it/websites/archive/ims2009/members/ferro/">Ferro Nicola</a>, docente dell'<a href="http://www.unipd.it/">Università di Padova</a> (dipartimento di <a href="http://www.dei.unipd.it">Ingegneria dell'Informazione</a>).<br>
        Il progetto è stato sviluppato e finalizzato da un team di studenti di tale corso.
        </br>
        <h2>Team</h2>
        <b><a href="mailto:crash.pc89@gmail.com">Agnolazza Francesco</a></b>: Software Developer;<br/>
        <b><a href="mailto:nicola.menon@libero.it">Menon Nicola</a></b>: Software Developer;<br/>
        <b><a href="http://twitter.com/GianJVM">Nalin Gianmarco</a></b>: Web Designer;<br/>
        <b><a href="https://twitter.com/zntfdr">Zanetello Federico</a></b>: Product Manager;<br/>
        </br>
        <h2>Presentazione del Progetto</h2>
        <ul style="list-style: none; margin-top: 20px;">
        	<li style=" display: inline-block;">
        		<object width="320" height="330"><param name="movie" value="https://video.google.com/get_player?docid=0B5BoSGcZv8seYXNGbjJxWlI4SGM&ps=docs&partnerid=30&cc_load_policy=1"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><embed src="https://video.google.com/get_player?docid=0B5BoSGcZv8seYXNGbjJxWlI4SGM&ps=docs&partnerid=30&cc_load_policy=1" type="application/x-shockwave-flash" allowfullscreen="true" allowScriptAccess="always" width="460" height="330"></object>
        	</li>
        	<li style="display: inline-block; margin-left: 20px;"><div id="about"></div>
        	</li>
        </ul>
        <div style="clear: both;"></div>
        </div>
    </div>
    <div id="footer">
    </div>
</body>

</html>