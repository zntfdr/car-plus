package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Entita.*;
import Utils.*;
import Store.*;

public class UpdateUtente extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		Utente ut = new Utente(req.getParameter("name"), req.getParameter("surname"), req.getParameter("radio"), req.getParameter("address"), req.getParameter("citta"), req.getParameter("provincia"), MD5.encrypt(req.getParameter("password")), req.getParameter("mail"), req.getParameter("phone"), false, false);

		// l'interrogazione da effettuare
		if(req.getParameter("password").compareTo("") == 0 ) 
			ut = StoreUtente.UpdateUtenteWithoutPassword(ut);
		else
			ut = StoreUtente.UpdateUtente(ut);

		HttpSession session = req.getSession();
		session.setAttribute("utente", ut);
		
		String page = "jsp/login.jsp"; //mi manderà alla home dell'utente o dell'amministratore in base alla sessione	
		res.sendRedirect(page);
	}
}
