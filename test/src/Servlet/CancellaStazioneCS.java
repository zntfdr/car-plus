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
			
		String descrizione, nome = req.getParameter("nome");			
		
		if(StoreStazione_CS.deleteStazioneCS(req.getParameter("citta"),req.getParameter("provincia"),nome))
			descrizione = "Cancellazione della stazione " + nome + " avvenuta con successo!";
		else
			descrizione = "Cancellazione della stazione " + nome + " non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";;
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_stazioni_cs.jsp"); //invia a lista stazioni cs
	}

}
