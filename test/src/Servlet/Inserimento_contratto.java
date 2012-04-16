package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

public class Inserimento_contratto extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Contratto cntr = new Contratto(0,Utils.TimeString.dataStringToCalendar(req.getParameter("data_stipula")),Utils.TimeString.dataStringToCalendar(req.getParameter("data_scadenza")),req.getParameter("email_cliente"),req.getParameter("nome_abbonamento"));
		String descrizione = "";
		
		if(StoreContratto.insertContratto(cntr))
			descrizione = "Inserimento del contratto (" + cntr.getEmail_cliente() + "," + cntr.getNome_abbonamento() + ") avvenuto con successo!";
		else
			descrizione = "Inserimento del contratto (" + cntr.getEmail_cliente() + "," + cntr.getNome_abbonamento() + ") non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione",descrizione);	
		res.sendRedirect("jsp/lista_contratti.jsp");
	}
}
