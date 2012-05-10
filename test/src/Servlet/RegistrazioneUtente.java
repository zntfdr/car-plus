package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

public class RegistrazioneUtente extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String descrizione, page;
		
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		//Inserisco la località
		Localita loc = new Localita(req.getParameter("citta"),req.getParameter("provincia"));
		StoreLocalita.insertLocalita(loc);
		
		//Inserisco l'utente
		Utente ut = new Utente(req.getParameter("name"), req.getParameter("surname"), req.getParameter("radio"), req.getParameter("address"), req.getParameter("citta"), req.getParameter("provincia"), MD5.encrypt(req.getParameter("password")), req.getParameter("mail"), req.getParameter("phone"), false, false);

		if(StoreUtente.insertUtente(ut))
			descrizione = "Registrazione di " + ut.getEmail() + " avvenuta con successo!";
		else
			descrizione = "Registrazione di " + ut.getEmail() + " non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
		
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", descrizione);

		//Redirigo alla pagina corretta in base a chi ha effettuato la registrazione
		if(session.getAttribute("ADMIN") != null)
			page = "jsp/lista_utenti.jsp";
		else
		{
			session.setAttribute("utente", ut); //visualizzer� tali informazioni nella landing page
			page ="jsp/new_user_landing.jsp";
		}
		
		res.sendRedirect(page);
	}
}
