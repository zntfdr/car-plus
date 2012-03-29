package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

/**
 *
 */
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
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String page = "";
		Partecipazione partecipazione = new Partecipazione(req.getParameter("user"),Integer.parseInt(req.getParameter("num_posti")),Integer.parseInt(req.getParameter("id")));
		Store.StorePartecipazione.insertPartecipazione(partecipazione);
		page = "jsp/user_home.jsp";
			
		res.sendRedirect(page);
	}
}