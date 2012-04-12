function showCity1(str, name)
{
var xmlhttp;    
if (str=="")
  {
  document.getElementById("citta1").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("citta1").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","../Get_citta?provincia="+str+"&selectName="+name,true);
xmlhttp.send();
}

function showStation(provincia, citta)
{
var xmlhttp;    
if (provincia=="")
  {
  document.getElementById("nomeStazione").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("nomeStazione").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","../Get_stazione?provincia="+provincia+"&citta="+citta,true);
xmlhttp.send();
}