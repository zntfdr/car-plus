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
		Utente login = StoreUtente.readUtente(email);

		String page = "";
		HttpSession session = req.getSession();
		
		if(login == null){
			page = "html/login.html";
		}
		else if(login.getPassword().compareTo(password) == 0) {
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
			page = "html/login.html?fail=TRUE";	
		}            
		res.sendRedirect(page);
	}
}
