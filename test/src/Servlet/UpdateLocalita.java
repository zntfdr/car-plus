package Servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Store.*;
import Utils.Query;

public class UpdateLocalita extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String descrizione;
		Localita newplace = new Localita(req.getParameter("city"),req.getParameter("province"));
		Localita oldplace = new Localita(req.getParameter("oldcity"),req.getParameter("oldprovince"));
	
		if(StoreLocalita.UpdateLocalita(newplace,oldplace))
			descrizione = "Aggiornamento della località (" + newplace.getCitta() + "," + newplace.getProvincia() + ") in (" + oldplace.getCitta() + "," + oldplace.getProvincia() + ") avvenuto con successo!";
		else
			descrizione = "Aggiornamento della località (" + newplace.getCitta() + "," + newplace.getProvincia() + ") in (" + oldplace.getCitta() + "," + oldplace.getProvincia() + ") non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";

		req.getSession().setAttribute("descrizione", descrizione); 
		res.sendRedirect("jsp/lista_localita.jsp");
	}
}
