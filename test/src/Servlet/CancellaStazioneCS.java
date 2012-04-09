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

public class CancellaStazioneCS extends HttpServlet {
       
	public void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
			
		String nome = req.getParameter("nome");			
		
		StoreStazione_CS.deleteStazioneCS(req.getParameter("citta"),req.getParameter("provincia"),nome);
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", "Cancellazione della stazione " + nome + " avvenuta con successo!");
		response.sendRedirect("jsp/lista_stazioni_cs.jsp"); //invia a lista stazioni cs
	}

}
