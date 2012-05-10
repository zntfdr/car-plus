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

public class CancellaModelloMacchina extends HttpServlet {
       
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");	
		String descrizione;
		int id = Integer.parseInt(request.getParameter("id"));			
		
		if(StoreModello_Macchina.deleteModelloMacchina(id))
			descrizione = "Cancellazione modello macchina #" + id + " avvenuta con successo!";
		else
			descrizione = "Cancellazione modello macchina #" + id + " non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_modelli_macchina.jsp"); //invia a lista modello macchina
	}

}
