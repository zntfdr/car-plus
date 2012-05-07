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

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		Abbonamento abb = new Abbonamento(req.getParameter("nome"),req.getParameter("descrizione"), Double.parseDouble(req.getParameter("tariffa_notturna")), Double.parseDouble(req.getParameter("tariffa_diurna")), Double.parseDouble(req.getParameter("tariffa_magg_100km")), Double.parseDouble(req.getParameter("tariffa_min_100km")), Double.parseDouble(req.getParameter("costo_mensile")), Integer.parseInt(req.getParameter("num_max_tessere")), Integer.parseInt(req.getParameter("num_min_tessere")));
		String[] modelli = req.getParameterValues("model");
		boolean abbOk = StoreAbbonamento.insertAbbonamento(abb);
		for(int i = 0; i<modelli.length; i++){
			StoreDisponibilita.insertDisponibilita(new Disponibilita(Integer.parseInt(modelli[i]), abb.getNome()));
		}
		if(abbOk)	
			session.setAttribute("descrizione", "Registrazione nuova abbonamento " + abb.getNome() + " avvenuta con successo!");
		else 
			session.setAttribute("descrizione", "Non � stato possibile inserire il nuovo abbonamento " + abb.getNome() + ". (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>");

		res.sendRedirect("jsp/lista_abbonamenti.jsp");
	}
}