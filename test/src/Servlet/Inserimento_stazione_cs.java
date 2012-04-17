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

public class Inserimento_stazione_cs extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Stazione_CS sCS = new Stazione_CS(req.getParameter("city"),req.getParameter("province"),req.getParameter("name"),req.getParameter("address"), Integer.parseInt(req.getParameter("num_places")));
		String descrizione = "";
		
		if(StoreStazione_CS.insertStazione_CS(sCS))
			descrizione = "Inserimento della stazione (" + sCS.getNome() + ", " + sCS.getProvincia() + ", " + sCS.getCitta() + ") avvenuto con successo!";
		else
			descrizione = "Inserimento della stazione (" + sCS.getNome() + ", " + sCS.getProvincia() + ", " + sCS.getCitta() + ") non avvenuta! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";

		HttpSession session = req.getSession();
		session.setAttribute("descrizione",descrizione);
		res.sendRedirect("jsp/lista_stazioni_cs.jsp");
	}
}
