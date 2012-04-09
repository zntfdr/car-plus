package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

/**
 *
 */
public class Inserimento_abbonamento extends HttpServlet {

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
		HttpSession session = req.getSession();
		Abbonamento abb = new Abbonamento(req.getParameter("nome"),req.getParameter("descrizione"), Double.parseDouble(req.getParameter("tariffa_notturna")), Double.parseDouble(req.getParameter("tariffa_diurna")), Double.parseDouble(req.getParameter("tariffa_magg_100km")), Double.parseDouble(req.getParameter("tariffa_min_100km")), Double.parseDouble(req.getParameter("costo_mensile")), Integer.parseInt(req.getParameter("num_max_tessere")), Integer.parseInt(req.getParameter("num_min_tessere")));
		StoreAbbonamento.insertAbbonamento(abb);
				
		session.setAttribute("descrizione", "Registrazione nuova abbonamento avvenuta con successo!");

		page = "jsp/lista_abbonamenti.jsp";
		res.sendRedirect(page);
	}
}