package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

/**
 *
 */
public class RegistrazioneUtente extends HttpServlet {

	/**
	 * Gestisce le richieste HTTP GETT
	 * 
	 * @param req
	 *            la richiesta ricevuta dal client.
	 * @param res
	 *            la rispota fornita dal server.
	 * 
	 * @throws ServletException
	 *             se ci sono problemi nell'esecuzione della servlet.
	 * @throws IOException
	 *             se ci sono problemi nella comunicazione client-server.
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

        Localita loc = new Localita(0, null, req.getParameter("provincia"), req.getParameter("citta"));
        String sql = "SELECT id  FROM localita WHERE citta = '" + loc.getCitta() +"' AND provincia = '" + loc.getProvincia() + "'";
        ResultSet rs = Query.doQueryRS(sql);
        try {       
        if(rs.getRow() != 0){
                while(rs.next()){
                    loc.setId(rs.getInt("id"));
                }
        }
        else {
            loc = StoreLocalita.insertLocalita(loc);
        }
        }catch (SQLException e){
            }
        Utente ut = new Utente(0, req.getParameter("name"), req.getParameter("surname"), req.getParameter("radio"), req.getParameter("address"), loc.getId(), MD5.encrypt(req.getParameter("password")), req.getParameter("mail"), req.getParameter("phone"), false, false);

		// l'interrogazione da effettuare
		ut = StoreUtente.insertUtente(ut);

		// imposta il tipo MIME della risposta
		res.setContentType("text/html");

		// pagine da invocare in caso di successo o fallimento
		String failure = "/jsp/failure.jsp?message=";
		String success = "/jsp/risultatoRegistrazione.jsp";

        HttpSession session = req.getSession();
	    session.setAttribute("utente", ut);
            
		RequestDispatcher dispatcher = req.getRequestDispatcher(success);
		dispatcher.forward(req, res);
	}
}
