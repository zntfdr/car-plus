package Servlet;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;
public class Inserimento_modello_macchina extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		Modello_Macchina mm = new Modello_Macchina(0, req.getParameter("marca"), req.getParameter("modello"), Integer.parseInt(req.getParameter("cilindrata")),Integer.parseInt(req.getParameter("anno")), req.getParameter("alimentazione"), Integer.parseInt(req.getParameter("emissioni_co2")), Integer.parseInt(req.getParameter("num_posti")));
		String descrizione;
		
		if(StoreModello_Macchina.insertModello_Macchina(mm))
			descrizione = "Inserimento del modello macchina (" + mm.getMarca() + "," + mm.getModello() + ") avvenuto con successo!";
		else
			descrizione = "Inserimento del modello macchina (" + mm.getMarca() + "," + mm.getModello() + ") non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", descrizione); 
		res.sendRedirect("jsp/lista_modelli_macchina.jsp");
	}
}
