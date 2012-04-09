package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Entita.Utente.Type;
import Utils.*;
import Store.*;

public class UpdateStazioneCS extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		Stazione_CS stCS = new Stazione_CS(req.getParameter("city"),req.getParameter("province"),req.getParameter("name"),req.getParameter("address"), Integer.parseInt(req.getParameter("num_places")));
	

		StoreStazione_CS.UpdateStazioneCS(stCS, req.getParameter("oldcity"),req.getParameter("oldprovince"),req.getParameter("oldname"));

		HttpSession session = req.getSession();
		
		session.setAttribute("descrizione", "Aggiornamento della stazione " + req.getParameter("oldname") + " avvenuto con successo!"); 
		
		String page = "jsp/lista_stazioni_cs.jsp";
		res.sendRedirect(page);
	}
}
