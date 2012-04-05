package Utils;
import javax.servlet.http.HttpSession;
import Entita.Utente;

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

		if (user == null) {
			header += "<li><a href=\"jsp/login.jsp\">Login</a></li>";
		} else {
			header += "<li><a href=\"user_home.jsp\">MyPage+</a></li><li><a href=\"logout.jsp\">Logout</a></li>";
		}
		
		header += "</ul></div>";
		
		return header;
	}
}
