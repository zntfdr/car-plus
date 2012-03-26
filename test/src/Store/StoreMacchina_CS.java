package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Macchina_CS;
import Entita.Stazione_CS;
import Utils.*;

public class StoreMacchina_CS{
	public static Macchina_CS insertMacchina_CS(Macchina_CS Value){
		String sql = "INSERT INTO macchina_CS(targa,id_modello,citta,provincia,nome_stazione_CS,anno_acquisto,scad_bollo,scad_assicurazione,scad_revisione,km_totali,prenotabile) VALUES('" + Value.getTarga() + "', " + Value.getId_modello() + ", '" + Value.getCitta() + "', '" + Value.getProvincia() + "', '" + Value.getNome_stazione_CS() + "', " + Value.getAnno_acquisto() + ", " + Value.getScad_bollo() + ", " + Value.getScad_assicurazione() + ", " + Value.getScad_revisione() + ", " + Value.getKm_totali() + ", TRUE)";
	    
		Query.doQuery(sql);
		return readMacchina_CS(Value.getTarga());
	}

	public static Macchina_CS readMacchina_CS(String targa){
		String sql = "SELECT * FROM macchina_CS WHERE targa = '" + targa + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Macchina_CS(rs.getString("targa"), rs.getInt("id_modello"),rs.getString("citta"),rs.getString("provincia"),rs.getString("nome_stazione_CS"),rs.getInt("anno_acquisto"),rs.getTimestamp("scad_bollo"),rs.getTimestamp("scad_assicurazione"),rs.getTimestamp("scad_revisione"),rs.getInt("km_totali"),rs.getBoolean("prenotabile"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	public static ArrayList<Macchina_CS> readMacchina_CS_List(ArrayList<String> listaMacchine){
		String sql = "SELECT * FROM stazione_cs WHERE ";
		for (int i=0; i<listaMacchine.size() - 1; i++){
			sql += "nome = '" + listaMacchine.get(i)+ "' OR ";
		}
		sql+= "nome = '" + listaMacchine.get(listaMacchine.size() - 1)+ "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<Macchina_CS> Macchine_List = new ArrayList<Macchina_CS>();
				while(rs.next()){
					Macchine_List.add(new Macchina_CS(rs.getString("targa"), rs.getInt("id_modello"),rs.getString("citta"),rs.getString("provincia"),rs.getString("nome_stazione_CS"),rs.getInt("anno_acquisto"),rs.getTimestamp("scad_bollo"),rs.getTimestamp("scad_assicurazione"),rs.getTimestamp("scad_revisione"),rs.getInt("km_totali"),rs.getBoolean("prenotabile")));
				}
				return Macchine_List;
			}catch (SQLException e){
			}
		}
		return null;
	}
}
