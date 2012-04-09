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

public class UpdateAbbonamento extends HttpServlet {
       
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
			
		String nome = req.getParameter("nome");
		Abbonamento abb = new Abbonamento(nome,req.getParameter("descrizione"), Double.parseDouble(req.getParameter("tariffa_notturna")), Double.parseDouble(req.getParameter("tariffa_diurna")), Double.parseDouble(req.getParameter("tariffa_magg_100km")), Double.parseDouble(req.getParameter("tariffa_min_100km")), Double.parseDouble(req.getParameter("costo_mensile")), Integer.parseInt(req.getParameter("num_max_tessere")), Integer.parseInt(req.getParameter("num_min_tessere")));
			
		StoreAbbonamento.UpdateAbbonamento(abb);
			
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", "Aggiornamento abbonamento " + nome + " avvenuta con successo!");
		response.sendRedirect("jsp/lista_abbonamenti.jsp"); //invia a lista utenti
	}

}
