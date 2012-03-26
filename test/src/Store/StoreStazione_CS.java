package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Abbonamento;
import Entita.Localita;
import Entita.Stazione_CS;
import Utils.*;

public class StoreStazione_CS{
	public static Stazione_CS insertStazione_CS(Stazione_CS Value){
		String sql = "INSERT INTO stazione_CS(citta, provincia, nome, indirizzo, num_posti) VALUES('" + Value.getCitta() + "', '" + Value.getProvincia() + "', '" + Value.getNome() + "', '" + Value.getIndirizzo() + "', " + Value.getNum_posti()+ ")";
	    
		Query.doQuery(sql);
		return readStazione_CS(Value.getCitta(),Value.getProvincia(),Value.getNome());
	}

	public static Stazione_CS readStazione_CS(String citta, String provincia, String nome){
		String sql = "SELECT * FROM stazione_CS WHERE citta = '" + citta + "' AND provincia = '" + provincia + "' AND nome = '" + nome +"'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Stazione_CS(rs.getString("citta"), rs.getString("provincia"), rs.getString("nome"),rs.getString("indirizzo"),rs.getInt("num_posti"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	public static ArrayList<Stazione_CS> readStazione_CS_List(ArrayList<String> listaStazioni){
		String sql = "SELECT * FROM stazione_cs WHERE ";
		for (int i=0; i<listaStazioni.size() - 1; i++){
			sql += "nome = '" + listaStazioni.get(i)+ "' OR ";
		}
		sql+= "nome = '" + listaStazioni.get(listaStazioni.size() - 1)+ "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<Stazione_CS> Stazioni_List = new ArrayList<Stazione_CS>();
				while(rs.next()){
					Stazioni_List.add(new Stazione_CS(rs.getString("citta"), rs.getString("provincia"), rs.getString("nome"),rs.getString("indirizzo"),rs.getInt("num_posti")));
				}
				return Stazioni_List;
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	public static ArrayList<Stazione_CS> getStazione_CS() {
		String sql_query = "SELECT * FROM stazione_cs";
		ResultSet rs = Query.doQueryRS(sql_query);
		if (rs != null) {
			try {
				ArrayList<Stazione_CS> list = new ArrayList<Stazione_CS>();
				while (rs.next()) {
					list.add(new Stazione_CS (rs.getString("citta"), rs.getString("provincia"), rs.getString("nome"),rs.getString("indirizzo"),rs.getInt("num_posti")));
				}
				return list;
			} catch (SQLException e) {
				
			}
		}
		
		return null;
	}

}
