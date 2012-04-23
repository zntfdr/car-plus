package Servlet;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class Inserimento_solo_targa extends HttpServlet {


	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String targa = req.getParameter("targa");
		int mod = Integer.parseInt(req.getParameter("model"));
		
		//Inserisco nuova macchina cp
		Macchina_CP mCP = new Macchina_CP(targa, mod);		
		StoreMacchina_CP.insertMacchina_CP(mCP);

		//Se tutto va bene, comincio a definire la sessione
		HttpSession session = req.getSession();
		String page = "";

		//ricavo dal db il modello della macchina
		Modello_Macchina modello = StoreModello_Macchina.readModello_Macchina(mod);

		session.setAttribute("modello_macchina_cp", modello);
		session.setAttribute("targa",targa);
		session.setAttribute("macchina_creata", true);
		page = "jsp/new_tragitto.jsp";	

		res.sendRedirect(page);
	}
}
