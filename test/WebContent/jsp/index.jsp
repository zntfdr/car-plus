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
    <title>Car+ | Il nuovo servizio di Car Pooling</title>
</head>

<body>
    
    <%= HTMLManager.getHeader(session) %>
    
    <div id="content">
        <div class="wrapper">
        <h1 style="text-align:center; width: 100%; margin:0 0 20px 0;"> Co2 Risparmiata:<% ArrayList<Integer> array = Interrogazione.getCo2Saved();%>
		<%for(Integer I : array){%>
		<img src="../img/numbers/<%= I %>.png">
		<%}%> grammi</h1>
        <div id="announce"></div>
        <div id="actions">
            <a href="search.jsp"><div id="search"></div></a>
            <a href="login.jsp"><div id="insert"></div></a>
        </div>
        <div style="clear: both;"></div>
    
        </div>
    </div>
    <div id="footer">
    </div>
</body>

</html>