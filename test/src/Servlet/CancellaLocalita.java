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

public class CancellaLocalita extends HttpServlet {
       
	public void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");	
		String descrizione;
		Localita old = new Localita (req.getParameter("citta"), req.getParameter("provincia"));			
		
		if(StoreLocalita.deleteLocalita(old))
			descrizione = "Cancellazione localita (" + old.getCitta() + "," + old.getProvincia() + ") avvenuta con successo!";
		else
			descrizione = "Cancellazione localita (" + old.getCitta() + "," + old.getProvincia() + ") non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_localita.jsp"); //invia a lista localita
	}

}
