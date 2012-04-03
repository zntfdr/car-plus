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

		//Fine conversione date

		//Inserisco nuova macchina cp
		Macchina_CP mCP = new Macchina_CP(req.getParameter("targa"), Integer.parseInt(req.getParameter("model")));		
		mCP =  StoreMacchina_CP.insertMacchina_CP(mCP);

		//Se tutto va bene, comincio a definire la sessione
		HttpSession session = req.getSession();
		String page = "";

		//ricavo dal db il modello della macchina
		ArrayList<String> listamm = new ArrayList<String>();
		listamm.add(""+req.getParameter("model"));
		ArrayList<Modello_Macchina> listaCompleta = Store.StoreModello_Macchina.readModello_Macchina_List(listamm);
		session.setAttribute("modello_macchina", listaCompleta);
		
		session.setAttribute("targa",req.getParameter("targa")); //passo il costrutto parametri alla pagina
		page = "jsp/new_tragitto.jsp";	

		res.sendRedirect(page);
	}
}
