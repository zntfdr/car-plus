package Servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Entita.Utente.Type;
import Utils.*;
import Store.*;

public class UpdateUtente extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String descrizione, page, email = req.getParameter("mail");
		boolean EsitoAggiornamento;
		Utente ut = new Utente(req.getParameter("name"), req.getParameter("surname"), req.getParameter("radio"), req.getParameter("address"), req.getParameter("citta"), req.getParameter("provincia"), MD5.encrypt(req.getParameter("password")), email, req.getParameter("phone"), false, false);

		// Aggiornamento account (aggiornando, o meno, la password)
		if(req.getParameter("password").equals(""))	{	EsitoAggiornamento = StoreUtente.UpdateUtenteWithoutPassword(ut); }
		else										{	EsitoAggiornamento = StoreUtente.UpdateUtente(ut); }

		HttpSession session = req.getSession();
		
		if (StoreCliente_business.readCliente_business(email) != null)	{ut.setUserType(Type.BUSINESS);	}
		else	if(StoreCliente.readCliente(email) != null)				{ut.setUserType(Type.CLIENTE);	}
		else 															{ut.setUserType(Type.USER);		}
		
		if (session.getAttribute("ADMIN") != null) {
			if(EsitoAggiornamento)
				descrizione = "Aggiornamento profilo di " + email + " avvenuto con successo!";
			else
				descrizione = "Aggiornamento profilo di " + email + " non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
			
			page = "jsp/lista_utenti.jsp";
		} 
		else { 
			if(EsitoAggiornamento)
				descrizione = "Aggiornamento profilo avvenuto con successo!";
			else
				descrizione = "Aggiornamento profilo non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";
			
			session.setAttribute("utente_loggato", ut);
			page = "jsp/user_home.jsp";
		}
		
		session.setAttribute("descrizione",descrizione);
		res.sendRedirect(page);
	}
}
