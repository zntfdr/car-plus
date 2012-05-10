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

public class CancellaAbbonamento extends HttpServlet {
       
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String descrizione, nome = request.getParameter("nome");
		
		if(StoreAbbonamento.deleteAbbonamento(nome))
			descrizione = "Cancellazione abbonamento " + nome + " avvenuta con successo!";
		else
			descrizione = "Cancellazione abbonamento " + nome + " non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione",descrizione); 
		response.sendRedirect("jsp/lista_abbonamenti.jsp"); //invia a lista abbonamenti
	}

}
