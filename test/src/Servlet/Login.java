package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import Entita.Utente;
import Store.*;
import Utils.*;

/**
 * Classe per il Login
 */
public class Login extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {


		String email = req.getParameter("username");
		String password = MD5.encrypt(req.getParameter("password"));
		Utente login = StoreUtente.readUtente(email);

		String page = "";
		HttpSession session = req.getSession();
		
		if(login == null){
			page = "/html/login.html";
		}
		else if(login.getPassword().compareTo(password) == 0) {
			session.setAttribute("utente",login);
			page = "/jsp/index.jsp"; //qui inviamo anche i dati session.setAttribute("utente",login);
		}
		else{
			page = "/html/login.html";	
		}            

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
		dispatcher.forward(req, res);
	}
}
