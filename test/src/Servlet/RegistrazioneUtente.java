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

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		Localita loc = new Localita(req.getParameter("provincia"), req.getParameter("citta"));
		loc = StoreLocalita.insertLocalita(loc);
		
		String email = req.getParameter("mail");
		Utente ut = new Utente(req.getParameter("name"), req.getParameter("surname"), req.getParameter("radio"), req.getParameter("address"), req.getParameter("citta"), req.getParameter("provincia"), MD5.encrypt(req.getParameter("password")), email, req.getParameter("phone"), false, false);

		// l'interrogazione da effettuare
		ut = StoreUtente.insertUtente(ut);

		HttpSession session = req.getSession();
		session.setAttribute("utente", ut);
		session.setAttribute("descrizione", "Registrazione di " + email + " avvenuta con successo!");
		
		res.sendRedirect("jsp/new_user_landing.jsp");
	}
}
