package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Abbonamento;
import Entita.Localita;
import Entita.Modello_Macchina;
import Entita.Stazione_CS;
import Utils.*;

public class StoreStazione_CS{
	
	public static boolean deleteStazioneCS(String citta, String provincia, String nome) {
		String sql_query = "delete from stazione_cs where citta = '" + citta + "' AND provincia = '" + provincia + "' AND nome = '" + nome + "'";
		return Query.doUpdate(sql_query);
	}
	
	public static ArrayList<String> getProvincia() {
		String sql_query = "SELECT DISTINCT provincia FROM stazione_cs ORDER BY provincia";
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
	
	public static boolean insertStazione_CS(Stazione_CS Value){
		String sql = "INSERT INTO stazione_CS(citta, provincia, nome, indirizzo, num_posti) VALUES('" + Value.getCitta() + "', '" + Value.getProvincia() + "', '" + Value.getNome() + "', '" + Value.getIndirizzo() + "', " + Value.getNum_posti()+ ")";
		return Query.doUpdate(sql);
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
		String sql_query = "SELECT * FROM stazione_cs ORDER BY provincia, citta, nome";
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

	public static boolean UpdateStazioneCS(Stazione_CS scs, String citta, String provincia, String nome){
    	String sql = "UPDATE stazione_cs SET citta = '" + scs.getCitta() + "', provincia = '" + scs.getProvincia() + "', nome = '" + scs.getNome() + "', indirizzo = '" + scs.getIndirizzo() + "', num_posti  = " + scs.getNum_posti() + " WHERE citta = '" + citta + "' AND provincia = '" + provincia + "' AND nome = '" + nome + "'";
    	return Query.doUpdate(sql);
    }
	
}
