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

/**
 *
 */
public class Vista_tragitti_tessera extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String page = "";
		int tessera_ID = Integer.parseInt(req.getParameter("id"));
		ArrayList<Tragitto_CS_info> lista = Store.StoreTragitto_CS_info.readTragitto_CS_info_tessera(tessera_ID);
		
		HttpSession session = req.getSession();
		session.setAttribute("lista_tragitti", lista); //passo il costrutto parametri alla pagina
		page = "jsp/lista_TragittiCSinfo_tessera.jsp";
			
		res.sendRedirect(page);
	}
}
