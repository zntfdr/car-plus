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

public class CancellaMacchinaCS extends HttpServlet {
       
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");		
		String descrizione, targa = request.getParameter("targa");			
		
		if(StoreMacchina_CS.deleteMacchinaCS(targa))
			descrizione = "Cancellazione della macchina di car sharing con targa " + targa + " avvenuta con successo!";
		else
			descrizione = "Cancellazione della macchina di car sharing con targa " + targa + " non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = request.getSession();
		session.setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_macchine_cs.jsp"); //invia a lista macchine cs
	}

}
