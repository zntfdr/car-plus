package Servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

public class UpdateAbbonamento extends HttpServlet {
       
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		String descrizione;
		Abbonamento abb = new Abbonamento(req.getParameter("nome"),req.getParameter("descrizione"), Double.parseDouble(req.getParameter("tariffa_notturna")), Double.parseDouble(req.getParameter("tariffa_diurna")), Double.parseDouble(req.getParameter("tariffa_magg_100km")), Double.parseDouble(req.getParameter("tariffa_min_100km")), Double.parseDouble(req.getParameter("costo_mensile")), Integer.parseInt(req.getParameter("num_max_tessere")), Integer.parseInt(req.getParameter("num_min_tessere")));
		
		if(StoreAbbonamento.UpdateAbbonamento(abb))
			descrizione = "Aggiornamento abbonamento " + abb.getNome() + " avvenuto con successo!";
		else
			descrizione = "Aggiornamento abbonamento " + abb.getNome() + " non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";;
		
		req.getSession().setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_abbonamenti.jsp"); //invia a abbonamenti
	}

}
