package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Abbonamento;
import Entita.Cliente;
import Entita.Tragitto_CP;
import Entita.Utente;
import Utils.*;

public class StoreAbbonamento{
	public static boolean deleteAbbonamento(String nome) {
		String sql = "DELETE FROM abbonamento WHERE nome = '" + nome + "'";
		return Query.doUpdate(sql);
	}
	
	public static boolean insertAbbonamento(Abbonamento abb){
		String sql = "INSERT INTO abbonamento(nome, descrizione, tariffa_magg_100km, tariffa_min_100km, tariffa_notturna, tariffa_diurna, costo_mensile, num_max_tessere, num_min_tessere) VALUES('" + abb.getNome() + "', '" + abb.getDescrizione() + "', " + abb.getTariffa_magg_100km() + ", " + abb.getTariffa_min_100km()  + ", " + abb.getTariffa_notturna()  + ", " + abb.getTariffa_diurna() +  ", " + abb.getCosto_mensile()  + ", " + abb.getNum_max_tessere()  + ", " + abb.getNum_min_tessere() +")";	    
		return Query.doUpdate(sql);
	}

	public static ArrayList<Abbonamento> getAbbonamenti() {
		String sql_query = "SELECT * FROM abbonamento ORDER BY nome";
		ResultSet rs = Query.doQueryRS(sql_query);
		if (rs != null) {
			try {
				ArrayList<Abbonamento> list = new ArrayList<Abbonamento>();
				while (rs.next()) {
					list.add(new Abbonamento (rs.getString("nome"), rs.getString("descrizione"), rs.getDouble("tariffa_magg_100km"), rs.getDouble("tariffa_min_100km"), rs.getDouble("tariffa_notturna"), rs.getDouble("tariffa_diurna"), rs.getDouble("costo_mensile"), rs.getInt("num_max_tessere"), rs.getInt("num_min_tessere")));
				}
				return list;
			} catch (SQLException e) {
				
			}
		}
		
		return null;
	}
	
	public static Abbonamento readAbbonamento(String nome){
		String sql = "SELECT * FROM abbonamento WHERE nome = '" + nome + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Abbonamento(rs.getString("nome"), rs.getString("descrizione"), rs.getDouble("tariffa_magg_100km"), rs.getDouble("tariffa_min_100km"), rs.getDouble("tariffa_notturna"), rs.getDouble("tariffa_diurna"), rs.getDouble("costo_mensile"), rs.getInt("num_max_tessere"), rs.getInt("num_min_tessere"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	public static ArrayList<Abbonamento> readAbbonamento_List(ArrayList<String> listaAbbonamenti){
		String sql = "SELECT * FROM abbonamento WHERE ";
		for (int i=0; i<listaAbbonamenti.size() - 1; i++){
			sql += "nome = '" + listaAbbonamenti.get(i)+ "' OR ";
		}
		sql+= "nome = '" + listaAbbonamenti.get(listaAbbonamenti.size() - 1)+ "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<Abbonamento> Abbonamenti_List = new ArrayList<Abbonamento>();
				while(rs.next()){
					Abbonamenti_List.add(new Abbonamento (rs.getString("nome"), rs.getString("descrizione"), rs.getDouble("tariffa_magg_100km"), rs.getDouble("tariffa_min_100km"), rs.getDouble("tariffa_notturna"), rs.getDouble("tariffa_diurna"), rs.getDouble("costo_mensile"), rs.getInt("num_max_tessere"), rs.getInt("num_min_tessere")));
				}
				return Abbonamenti_List;
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	 public static void UpdateAbbonamento(Abbonamento abb){
	    	String sql = "UPDATE abbonamento SET descrizione = '" + abb.getDescrizione() + "',  tariffa_magg_100km = " + abb.getTariffa_magg_100km() + ",  tariffa_min_100km = " + abb.getTariffa_min_100km() + ",  tariffa_notturna = " + abb.getTariffa_notturna() + ",  tariffa_diurna = " + abb.getTariffa_diurna() + ",  costo_mensile = " + abb.getCosto_mensile() + ",  num_max_tessere = " + abb.getNum_max_tessere() + ",  num_min_tessere = " + abb.getNum_min_tessere() + "  WHERE nome = '"+ abb.getNome() + "'";
	    	Query.doUpdate(sql);
	 }
}
