package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Cliente;
import Entita.Localita;
import Entita.Localita;
import Utils.*;

public class StoreLocalita{
	public static boolean deleteLocalita(Localita old) {
		String sql = "DELETE FROM localita WHERE citta = '" + old.getCitta() + "' AND provincia = '" + old.getProvincia() + "'";
		return Query.doUpdate(sql);
	}
	
	public static boolean insertLocalita(Localita loc){
		String sql = "INSERT INTO localita(provincia, citta) VALUES('" + loc.getProvincia() + "', '" + loc.getCitta() + "')";
		return Query.doUpdate(sql);
	}

	public static Localita readLocalita(String provincia, String citta){
		String sql = "SELECT * FROM localita WHERE provincia = '" + provincia + "' AND citta = '" + citta + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Localita(rs.getString("citta"),rs.getString("provincia"));
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static ArrayList<Localita> readLocalita_List(ArrayList<String> listalocalita){
		String sql = "SELECT * FROM localita WHERE ";
		for (int i=0; i<listalocalita.size() - 1; i++){
			sql += "citta  = '" + listalocalita.get(i)+ "' OR ";
		}
		sql+= "citta = '" + listalocalita.get(listalocalita.size() - 1)+ "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<Localita> Localita_List = new ArrayList<Localita>();
				while(rs.next()){
					Localita_List.add(new Localita(rs.getString("citta"),rs.getString("provincia")));
				}
				return Localita_List;
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	public static ArrayList<Localita> getLocalita() {
		String sql_query = "SELECT * FROM localita ORDER BY provincia, citta";
		ResultSet rs = Query.doQueryRS(sql_query);
		if (rs != null) {
			try {
				ArrayList<Localita> list = new ArrayList<Localita>();
				while (rs.next()) {
					list.add(new Localita (rs.getString("citta"), rs.getString("provincia")));
				}
				return list;
			} catch (SQLException e) {
				
			}
		}
		
		return null;
	}
	
	public static ArrayList<String> getCitta(String Provincia) {
		String sql_query = "SELECT Citta FROM localita WHERE provincia = '"+Provincia + "' ORDER BY citta";
		ResultSet rs = Query.doQueryRS(sql_query);
		if (rs != null) {
			try {
				ArrayList<String> list = new ArrayList<String>();
				while (rs.next()) {
					list.add(rs.getString("citta"));
				}
				return list;
			} catch (SQLException e) {
				
			}
		}
		return null;
	}
	
	public static ArrayList<String> getProvincia() {
		String sql_query = "SELECT DISTINCT provincia FROM localita ORDER BY provincia";
		ResultSet rs = Query.doQueryRS(sql_query);
		if (rs != null) {
			try {
				ArrayList<String> list = new ArrayList<String>();
				while (rs.next()) {
					list.add(rs.getString("provincia"));
				}
				return list;
			} catch (SQLException e) {
				
			}
		}
		return null;
	}

	public static boolean UpdateLocalita(Localita newplace, Localita oldplace) {
		String sql = "UPDATE localita SET citta = '"+ newplace.getCitta() +"', provincia = '"+ newplace.getProvincia() +"' WHERE  citta = '" + oldplace.getCitta() + "' AND provincia = '" + oldplace.getProvincia() + "'";
		return Query.doUpdate(sql);
	}
}
