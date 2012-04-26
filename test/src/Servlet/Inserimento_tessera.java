package Servlet;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

public class Inserimento_tessera extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String descrizione ="C'è stato qualche problema";
		int numTessere = Integer.parseInt(req.getParameter("numTessere"));
		int idContratto = Integer.parseInt(req.getParameter("idContratto"));
		
		for(int i = 0; i<numTessere; i++){
			Store.StoreTessera.insertTessera(new Tessera(-1, idContratto));
		}
		
		ArrayList<Tessera> listaTessere= Store.StoreTessera.getTesseraFromContratto(idContratto);
		if(!listaTessere.isEmpty()){// Attenzione a diversi contratti...
			descrizione = "Sono state registrate le nuove tessere";
		}
		HttpSession session = req.getSession();
		session.setAttribute("descrizione", descrizione);
		session.setAttribute("listaTessere", listaTessere);
		res.sendRedirect("jsp/lista_tessere_utente.jsp");
	}
}