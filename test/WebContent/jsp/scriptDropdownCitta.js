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

function showCity2(str, name)
{
var xmlhttp;    
if (str=="")
  {
  document.getElementById("citta2").innerHTML="";
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
    document.getElementById("citta2").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","../Get_citta?provincia="+str+"&selectName="+name,true);
xmlhttp.send();
}