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
		Abbonamento abb = new Abbonamento(req.getParameter("nome"),req.getParameter("descrizione"), Double.parseDouble(req.getParameter("tariffa_notturna")), Double.parseDouble(req.getParameter("tariffa_diurna")), Double.parseDouble(req.getParameter("tariffa_magg_100km")), Double.parseDouble(req.getParameter("tariffa_min_100km")), Integer.parseInt(req.getParameter("costo_mensile")), Integer.parseInt(req.getParameter("num_max_tessere")), Integer.parseInt(req.getParameter("num_min_tessere")));
		abb = StoreAbbonamento.insertAbbonamento(abb);
		
		HttpSession session = req.getSession();
		session.setAttribute("abbonamento_nuovo", abb); //passo il costrutto parametri alla pagina
		page = "jsp/new_abbonamento.jsp";
		
		res.sendRedirect(page);
	}
}