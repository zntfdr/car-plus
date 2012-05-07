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
				"<li><a href=\"../jsp/azienda.jsp\">Azienda</a></li>" +
				"<li> <a href=\"../jsp/about.jsp\">Contattaci</a></li>" + 
				"<li> <a href=\"../jsp/about.jsp\">Chi siamo</a></li>";

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
}
