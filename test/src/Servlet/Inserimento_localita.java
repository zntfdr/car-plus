package Servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

public class Inserimento_localita extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		Localita loc = new Localita(req.getParameter("city"),req.getParameter("province"));
		String descrizione;
		
		if(StoreLocalita.insertLocalita(loc))
			descrizione = "Inserimento del localita (" + loc.getProvincia() + "," + loc.getCitta() + ") avvenuto con successo!";
		else
			descrizione = "Inserimento del localita (" + loc.getProvincia() + "," + loc.getCitta() + ") non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", descrizione); 
		res.sendRedirect("jsp/lista_localita.jsp");
	}
}
