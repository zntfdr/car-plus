package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.*;
import javax.servlet.http.*;

import Entita.Contratto;
import Entita.Tragitto_CS_info;
import Entita.Utente;
import Entita.Utente.Type;
import Store.*;
import Utils.*;

/**
 * Classe per il Login
 */
public class Pagamenti extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String page = "";
		String email = req.getParameter("cliente");		
		HttpSession session = req.getSession();
		session.setAttribute("email_cliente", email);
		page = "jsp/pagamentiCliente.jsp";
			
		res.sendRedirect(page);
		
	}
}
