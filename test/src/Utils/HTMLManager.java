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
			menu+="<a href=\"new_tragitto_cs_check.jsp\"><div id=\"insertcs\">Prenota una macchina</div></a>" + // prenota tragitto car sharing
					"<a href=\"iltuoconto.jsp\"><div id=\"iltuoconto\">Visualizza il tuo conto</div></a>" + //Visualizzazione conto
					"<a href=\"lista_TragittiCSinfo_cliente.jsp\"><div id=\"lista_TragittiCSinfo_cliente\">Visualizza la tua lista_TragittiCSinfo_cliente</div></a>" + //Visualizzazione lista_TragittiCSinfo_cliente
					"<a href=\"lista_TragittiCSinfo_contratto.jsp\"><div id=\"lista_TragittiCSinfo_contratto\">lista_TragittiCSinfo_contratto</div></a>" + //Visualizzazione lista_TragittiCSinfo_contratto
					"<a href=\"lista_TragittiCSinfo_tessera.jsp\"><div id=\"lista_TragittiCSinfo_tessera.jsp\">lista_TragittiCSinfo_tessera.jsp</div></a>" + //Visualizzazione lista_TragittiCSinfo_tessera.jsp
					"<a href=\"listaTragittiCsinfo.jsp\"><div id=\"listaTragittiCsinfo.jsp\">listaTragittiCsinfo.jsp</div></a>"; //Visualizzazione listaTragittiCsinfo.jsp
			//		"<a href=\"#\"><div id=\"#\">#</div></a>"; //Visualizzazione #
		}
        menu+="</div>";
		return menu;
	}
}
