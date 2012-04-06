package Utils;
import javax.servlet.http.HttpSession;
import Entita.Utente;
import Entita.Utente.Type;

public class HTMLManager {
	
	public static String getHeader(HttpSession session) {
		Utente user = (Utente) session.getAttribute("utente_loggato");
		String header = "<div id=\"header\">" +
				"<ul>" +
				"<li><a href=\".\"><img src=\"../img/logo.png\" alt=\"Logo\"/></a></li>" +
				"<li><a href=\".\">Home</a></li>" +
				"<li><a href=\"#\">Azienda</a></li>" +
				"<li><a href=\"#\">Servizi</a></li>" +
				"<li> <a href=\"#\">Contattaci</a></li>";

		if(session.getAttribute("ADMIN") != null) {
			header += "<li><a href=\"admin_home.jsp\">Admin+</a></li><li><a href=\"logout.jsp\">Logout</a></li>";
		} else if (user == null) {
			header += "<li><a href=\"login.jsp\">Login</a></li>";
		} else {
			header += "<li><a href=\"user_home.jsp\">MyPage+</a></li><li><a href=\"logout.jsp\">Logout</a></li>";
		}
		
		header += "</ul></div>";
		
		return header;
	}
	
	public static String getUserMenu(Utente user){
		String menu = "<div id=\"actions\">" + 
				"<a href=\"search.jsp\"><div id=\"search\"></div></a>" + //ricerca TRAGITTO CP
				"<a href=\"new_tragitto.jsp\"><div id=\"insert\"></div></a>"; //inserimento TRAGITTO CP
		if(user.getUserType() == Type.CLIENTE || user.getUserType() == Type.BUSINESS){
			menu+="<a href=\"new_tragitto_cs_check.jsp\"><div id=\"account\"></div></a>"; //prenotazione TRAGITTO CS
		}
        menu+="</div>";
		return menu;
	}
}
