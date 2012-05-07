package Servlet;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import Entita.*;
import Utils.*;
import Store.*;

public class UpdateAbbonamento extends HttpServlet {
       
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String descrizione;
		Abbonamento abb = new Abbonamento(req.getParameter("nome"),req.getParameter("descrizione"), Double.parseDouble(req.getParameter("tariffa_notturna")), Double.parseDouble(req.getParameter("tariffa_diurna")), Double.parseDouble(req.getParameter("tariffa_magg_100km")), Double.parseDouble(req.getParameter("tariffa_min_100km")), Double.parseDouble(req.getParameter("costo_mensile")), Integer.parseInt(req.getParameter("num_max_tessere")), Integer.parseInt(req.getParameter("num_min_tessere")));
		String newNome = abb.getNome();
		String oldNome= (String)req.getSession().getAttribute("oldNome");
		String[] modelli = req.getParameterValues("model");
		ArrayList<Integer> oldMod = (ArrayList<Integer>)req.getSession().getAttribute("oldMod");
		ArrayList<Integer> newMod = new ArrayList<Integer>();
		for(int i =0; i<modelli.length; i++){
			newMod.add(Integer.parseInt(modelli[i]));
		}
		
		for(Integer i : oldMod){
			if(newMod.contains(i)){
				if(newNome.compareTo(oldNome)!=0){
					StoreDisponibilita.updateDisponibilita(new Disponibilita(i,newNome), new Disponibilita(i, oldNome));
				}
			}
			else {
				StoreDisponibilita.deleteDisponibilita(new Disponibilita(i,oldNome));
			}
		}
		for(Integer i : newMod){
			if(!oldMod.contains(i)){
				StoreDisponibilita.insertDisponibilita(new Disponibilita(i, newNome));
			}
		}
		
		if(StoreAbbonamento.UpdateAbbonamento(abb))
			descrizione = "Aggiornamento abbonamento " + abb.getNome() + " avvenuto con successo!";
		else
			descrizione = "Aggiornamento abbonamento " + abb.getNome() + " non avvenuto! (Errore SQL: " + Query.erroreSQL + ")  <a href=\"javascript:history.go(-1)\">Torna indietro</a>";;
		
		req.getSession().setAttribute("descrizione", descrizione);
		response.sendRedirect("jsp/lista_abbonamenti.jsp"); //invia a abbonamenti
	}

}
