package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Cliente;
import Entita.Localita;
import Entita.Localita;
import Utils.*;

public class StoreLocalita{
	public static Localita insertLocalita(Localita loc){
		String sql = "INSERT INTO localita(provincia, citta) VALUES('" + loc.getProvincia() + "', '" + loc.getCitta() + "')";

		Query.doQuery(sql);
		return readLocalita(loc.getProvincia(), loc.getCitta());
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
		String sql_query = "SELECT * FROM localita";
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
}
