package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.Contratto;
import Entita.Utente;
import Entita.Utente.Type;
import Store.*;
import Utils.*;

/**
 * Classe per il Login
 */
public class Login extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {


		String email = req.getParameter("username");
		String password = MD5.encrypt(req.getParameter("password"));
		String page = "";
		HttpSession session = req.getSession();
		
		// Controllo se si sta loggando un amministratore
		String ROOT = "root";
		if( email.compareTo(ROOT) == 0 && password.compareTo(MD5.encrypt(ROOT)) == 0) {
			page = "jsp/admin_home.jsp";
			session.setAttribute("ADMIN",ROOT);
			res.sendRedirect(page);
			return;
		}
		else {
			//Se arrivi ad eseguire qui, sei un utente che sta provando a loggarsi
			Utente login = StoreUtente.readUtente(email);

			if(login == null){
				page = "jsp/login.jsp?error=1";
			}
			else if(login.getPassword().compareTo(Password.checkpsw(password)) == 0) {
				if (StoreCliente_business.readCliente_business(email) != null){
					login.setUserType(Type.BUSINESS);
					ArrayList<Contratto> listaContratti = StoreContratto.listaContrattiUtente(email);
					session.setAttribute("listaContratti",listaContratti);
				}
				else if(StoreCliente.readCliente(email) != null){
					login.setUserType(Type.CLIENTE);
					ArrayList<Contratto> listaContratti = StoreContratto.listaContrattiUtente(email);
					session.setAttribute("listaContratti",listaContratti);
				}
				else{
					login.setUserType(Type.USER);
				}
				session.setAttribute("utente_loggato",login);
				page = "jsp/user_home.jsp";
			}
			else{
				page = "jsp/login.jsp?error=1";	
			}            
			res.sendRedirect(page);
		}
	}
}
