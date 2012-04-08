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

public class Interrogazione extends HttpServlet {
	
	public static ArrayList<String> ListaClientiNonClientiBusiness(){
		ArrayList<String> array = new ArrayList<String>();
		String sql = "SELECT email_utente FROM cliente WHERE email_utente NOT IN (SELECT email_utente FROM cliente_business)";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		
		try { while(rs.next()) { array.add(rs.getString("email_utente")); }
		} catch (SQLException e) {}

		return array;
	}
	
	public static ArrayList<String> ListaUtentiNonClienti(){
		ArrayList<String> array = new ArrayList<String>();
		String sql = "SELECT email FROM utente WHERE email NOT IN (SELECT email_utente FROM cliente)";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		
		if(rs != null) {
			try {
				while(rs.next()) { 
					array.add(rs.getString("email"));	
				}
			} catch (SQLException e) { }
		}
		return array;
	}
	
	public static ArrayList<Macchina_CP> ListaMacchineUtente(String email){
		String sql = "SELECT targa, modello_macchina FROM utente AS U INNER JOIN tragitto_CP AS TCP ON U.email = TCP.email_utente INNER JOIN macchina_cp AS MCP ON TCP.targa_cp = MCP.targa WHERE email = '" + email + "'GROUP BY targa, modello_macchina";
		
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<Macchina_CP> Macchine_List = new ArrayList<Macchina_CP>();
				while(rs.next()){
					Macchine_List.add(new Macchina_CP( rs.getString("targa"), rs.getInt("modello_macchina")));
				}
				return Macchine_List;
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	public static Modello_Macchina ModelloMacchina(String Targa){ //data una targa, riusciamo ad ottenere il modello della macchina 
		String sql = "select * from modello_macchina join macchina_cp on modello_macchina = id WHERE targa = '" + Targa + "'";

		
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Modello_Macchina(rs.getInt("modello_macchina"), rs.getString("marca"), rs.getString("modello"), rs.getInt("cilindrata"),rs.getInt("anno"), rs.getString("alimentazione"), rs.getInt("emissioni_co2"), rs.getInt("num_posti"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	public static Modello_Macchina ModelloMacchinaCS(String Targa){ //data una targa, riusciamo ad ottenere il modello della macchina 
		String sql = "SELECT * FROM modello_macchina AS MM JOIN macchina_cs AS MCS ON MM.id = MCS.id_modello WHERE targa = '" + Targa + "'";

		
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Modello_Macchina(rs.getInt("id"), rs.getString("marca"), rs.getString("modello"), rs.getInt("cilindrata"),rs.getInt("anno"), rs.getString("alimentazione"), rs.getInt("emissioni_co2"), rs.getInt("num_posti"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
	public static int Numero_Utenti_Registrati()
	{
		String sql = "SELECT COUNT(*) AS numero_utenti_registrati FROM utente";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null) {
			try {
				while(rs.next()) { 
					return rs.getInt("numero_utenti_registrati");	
				}
			} catch (SQLException e) { }
		}
		return 0; 
	}
	
	public static int Numero_Clienti_Registrati()
	{
		String sql = "SELECT COUNT(*) AS numero_clienti_registrati FROM cliente";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null) {
			try {
				while(rs.next()) { 
					return rs.getInt("numero_clienti_registrati");	
				}
			} catch (SQLException e) { }
		}
		return 0; 
	}
	
	public static int Numero_Stazioni_registrate()
	{
		String sql = "SELECT COUNT(*) AS Numero_Stazioni_Registrate FROM stazione_cs";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null) {
			try {
				while(rs.next()) { 
					return rs.getInt("Numero_Stazioni_Registrate");	
				}
			} catch (SQLException e) { }
		}
		return 0; 
	} 
	
	public static int NumeroMacchineRegistrate()
	{
		String sql = "SELECT COUNT(*) AS NumeroMacchineRegistrate FROM macchina_cs";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null) {
			try {
				while(rs.next()) { 
					return rs.getInt("NumeroMacchineRegistrate");	
				}
			} catch (SQLException e) { }
		}
		return 0; 
	}
	
	public static ArrayList<Integer> getCo2Saved(){//posizione 0 dell'array = cifra piu significativa
		ArrayList<Integer> array = new ArrayList<Integer>();
		String sql = "SELECT sum FROM co2_risparmiata";
		String sum="";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		if(rs != null) {
			try {
				while(rs.next()) { 
					sum = rs.getString("sum");	
				}
			} catch (SQLException e) { }
		}
		if (sum == null || sum.compareTo("")==0){
			array.add(0);
		} else {
			for(int i = 0; i<sum.length();i++){
				array.add(Integer.parseInt(sum.substring(i, i+1)));
			}
		}
		return array;
	}
}
