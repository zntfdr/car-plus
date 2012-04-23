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
	
	public static int CountTessere(Contratto C){
		String sql = "SELECT COUNT(*) FROM tessera WHERE id_contratto = " + C.getId() ;
    	ResultSet rs = Query.doQueryRS(sql);
    	if(rs != null){
			try {
				while(rs.next()){
					return rs.getInt("count");
				}
			}catch (SQLException e){
			}
		}
		return -1;
	}
	
	public static ArrayList<String> ListaAbbonamenti(){
		ArrayList<String> array = new ArrayList<String>();
		String sql = "SELECT nome FROM abbonamento ORDER BY nome";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		
		try { while(rs.next()) { array.add(rs.getString("nome")); }
		} catch (SQLException e) {}

		return array;
	}

	public static ArrayList<String> ListaClientiNonClientiBusiness(){
		ArrayList<String> array = new ArrayList<String>();
		String sql = "SELECT email_utente FROM cliente WHERE email_utente NOT IN (SELECT email_utente FROM cliente_business) ORDER BY email_utente";
		ResultSet rs = Utils.Query.doQueryRS(sql);
		
		try { while(rs.next()) { array.add(rs.getString("email_utente")); }
		} catch (SQLException e) {}

		return array;
	}
	
	public static ArrayList<Contratto> listaContrattiUtente(String emailCliente){
		String sql = "SELECT * FROM contratto WHERE email_cliente = '" + emailCliente +"'";
		ArrayList<Contratto> listaContratti = new ArrayList<Contratto>();
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					listaContratti.add(new Contratto(rs.getInt("id"), Utils.TimeString.dataStringToCalendar(rs.getString("data_stipula")), Utils.TimeString.dataStringToCalendar(rs.getString("data_scadenza")), rs.getString("email_cliente"), rs.getString("nome_abbonamento")));
				}
				return listaContratti;
			}catch (SQLException e){
			}
		}
		return listaContratti;
	}
	
	public static ArrayList<Tragitto_CP> listaTraggittiUtenteCreatiDaLui(String emailUtente){
		String sql = "SELECT * FROM tragitto_cp WHERE email_utente = '" + emailUtente +"' ORDER BY tempo_partenza";
		ArrayList<Tragitto_CP> listaTragitti = new ArrayList<Tragitto_CP>();
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					listaTragitti.add(new Tragitto_CP(rs.getInt("id"), rs.getBoolean("fumatori"), rs.getInt("num_posti"), rs.getString("note"), rs.getString("citta_partenza"), rs.getString("provincia_partenza"), rs.getString("citta_arrivo"), rs.getString("provincia_arrivo"), rs.getString("email_utente"), rs.getString("targa_CP"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_partenza")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_arrivo"))));
				}
				return listaTragitti;
			}catch (SQLException e){
			}
		}
		return listaTragitti;
	}
	
	public static ArrayList<Tragitto_CP> listaTraggittiUtenteInCuiPartecipa(String emailUtente){
		String sql = "SELECT id, fumatori, tcp.num_posti, note, citta_partenza, provincia_partenza, citta_arrivo, provincia_arrivo, tcp.email_utente, targa_CP, tempo_partenza, tempo_arrivo FROM tragitto_cp AS tcp JOIN partecipazione AS p ON id = id_tragitto_cp WHERE p.email_utente = '" + emailUtente +"' ORDER BY tempo_partenza";
		ArrayList<Tragitto_CP> listaTragitti = new ArrayList<Tragitto_CP>();
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					listaTragitti.add(new Tragitto_CP(rs.getInt("id"), rs.getBoolean("fumatori"), rs.getInt("num_posti"), rs.getString("note"), rs.getString("citta_partenza"), rs.getString("provincia_partenza"), rs.getString("citta_arrivo"), rs.getString("provincia_arrivo"), rs.getString("email_utente"), rs.getString("targa_CP"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_partenza")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_arrivo"))));
				}
				return listaTragitti;
			}catch (SQLException e){
			}
		}
		return listaTragitti;
	}
	
	public static ArrayList<String> ListaUtentiNonClienti(){
		ArrayList<String> array = new ArrayList<String>();
		String sql = "SELECT email FROM utente WHERE email NOT IN (SELECT email_utente FROM cliente) ORDER BY email";
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
	
	public static ArrayList<String> ListaUtenti(){
		ArrayList<String> array = new ArrayList<String>();
		String sql = "SELECT email FROM utente ORDER BY email";
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
		String sql = "SELECT targa, modello_macchina FROM utente AS U INNER JOIN tragitto_CP AS TCP ON U.email = TCP.email_utente INNER JOIN macchina_cp AS MCP ON TCP.targa_cp = MCP.targa WHERE email = '" + email + "'GROUP BY targa, modello_macchina ORDER BY targa, modello_macchina";
		
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
