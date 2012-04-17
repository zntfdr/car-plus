package Servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

public class UpdateStazioneCS extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String descrizione;
		Stazione_CS stCS = new Stazione_CS(req.getParameter("city"),req.getParameter("province"),req.getParameter("name"),req.getParameter("address"), Integer.parseInt(req.getParameter("num_places")));

		if(StoreStazione_CS.UpdateStazioneCS(stCS, req.getParameter("oldcity"),req.getParameter("oldprovince"),req.getParameter("oldname")))
			descrizione = "Aggiornamento della stazione " + req.getParameter("oldname") + " avvenuto con successo!";
		else
			descrizione = "Aggiornamento della stazione " + req.getParameter("oldname") + " non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";

		req.getSession().setAttribute("descrizione", descrizione); 
		res.sendRedirect("jsp/lista_stazioni_cs.jsp");
	}
}
