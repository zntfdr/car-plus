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
}
