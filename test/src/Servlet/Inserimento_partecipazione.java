package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

public class Inserimento_partecipazione extends HttpServlet {

	/**
	 * Gestisce le richieste HTTP GETT
	 * 
	 * @param req
	 *            la richiesta ricevuta dal client.
	 * @param res
	 *            la rispota fornita dal server.
	 * 
	 * @throws ServletException
	 *             se ci sono problemi nell'esecuzione della servlet.
	 * @throws IOException
	 *             se ci sono problemi nella comunicazione client-server.
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String descrizione = "";
		Partecipazione partecipazione = new Partecipazione(req.getParameter("user"),Integer.parseInt(req.getParameter("num_posti")),Integer.parseInt(req.getParameter("id")));
		
		if(StorePartecipazione.insertPartecipazione(partecipazione))
			descrizione = "Partecipazione confermata!";
		else
			descrizione = "Partecipazione non confermata! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", descrizione); 
		res.sendRedirect("jsp/lista_TragittiCP_utente.jsp");
	}
}