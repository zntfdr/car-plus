package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Macchina_CS;
import Entita.Modello_Macchina;
import Entita.Stazione_CS;
import Utils.*;

public class StoreMacchina_CS{
	
	public static boolean deleteMacchinaCS(String targa) {
		String sql_query = "delete from macchina_cs where targa = '" + targa + "'";
		return Query.doUpdate(sql_query);
	}
	
	public static ArrayList<Macchina_CS> getMacchina_CS() {
		String sql_query = "SELECT * FROM macchina_cs ORDER BY provincia, citta, nome_stazione_CS, id_modello, targa";
		ResultSet rs = Query.doQueryRS(sql_query);
		if (rs != null) {
			try {
				ArrayList<Macchina_CS> list = new ArrayList<Macchina_CS>();
				while (rs.next()) {
					list.add(new Macchina_CS (rs.getString("targa"), rs.getInt("id_modello"),rs.getString("citta"),rs.getString("provincia"),rs.getString("nome_stazione_CS"),rs.getInt("anno_acquisto"), Utils.TimeString.dataStringToCalendar(rs.getString("scad_bollo")), Utils.TimeString.dataStringToCalendar(rs.getString("scad_assicurazione")), Utils.TimeString.dataStringToCalendar(rs.getString("scad_revisione")),rs.getInt("km_totali"),rs.getBoolean("prenotabile")));
				}
				return list;
			} catch (SQLException e) {
				
			}
		}
		
		return null;
	}
	
	public static boolean insertMacchina_CS(Macchina_CS Value){
		String sql = "INSERT INTO macchina_CS(targa,id_modello,citta,provincia,nome_stazione_CS,anno_acquisto,scad_bollo,scad_assicurazione,scad_revisione,km_totali,prenotabile) VALUES('" + Value.getTarga() + "', '" + Value.getId_modello() + "', '" + Value.getCitta() + "', '" + Value.getProvincia() + "', '" + Value.getNome_stazione_CS() + "', '" + Value.getAnno_acquisto() + "', '" + Utils.TimeString.dataCalendarToString(Value.getScad_bollo()) + "', '" + Utils.TimeString.dataCalendarToString(Value.getScad_assicurazione()) + "', '" + Utils.TimeString.dataCalendarToString(Value.getScad_revisione()) + "', '" + Value.getKm_totali() + "', TRUE)";
		return Query.doUpdate(sql);
	}

	public static Macchina_CS readMacchina_CS(String targa){
		String sql = "SELECT * FROM macchina_CS WHERE targa = '" + targa + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Macchina_CS(rs.getString("targa"), rs.getInt("id_modello"),rs.getString("citta"),rs.getString("provincia"),rs.getString("nome_stazione_CS"),rs.getInt("anno_acquisto"), Utils.TimeString.dataStringToCalendar(rs.getString("scad_bollo")), Utils.TimeString.dataStringToCalendar(rs.getString("scad_assicurazione")), Utils.TimeString.dataStringToCalendar(rs.getString("scad_revisione")),rs.getInt("km_totali"),rs.getBoolean("prenotabile"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
	
	public static ArrayList<Macchina_CS> readMacchina_CS_List(ArrayList<String> listaMacchine){
		String sql = "SELECT * FROM macchina_cs WHERE ";
		for (int i=0; i<listaMacchine.size() - 1; i++){
			sql += "targa = '" + listaMacchine.get(i)+ "' OR ";
		}
		if (listaMacchine.size()>0) sql+= "targa = '" + listaMacchine.get(listaMacchine.size() - 1)+ "'";
		ResultSet rs = Query.doQueryRS(sql);
		ArrayList<Macchina_CS> Macchine_List = new ArrayList<Macchina_CS>();	
		if(rs != null){
			try {
				while(rs.next()){
					Macchine_List.add(new Macchina_CS(rs.getString("targa"), rs.getInt("id_modello"),rs.getString("citta"),rs.getString("provincia"),rs.getString("nome_stazione_CS"),rs.getInt("anno_acquisto"), Utils.TimeString.dataStringToCalendar(rs.getString("scad_bollo")), Utils.TimeString.dataStringToCalendar(rs.getString("scad_assicurazione")), Utils.TimeString.dataStringToCalendar(rs.getString("scad_revisione")),rs.getInt("km_totali"),rs.getBoolean("prenotabile")));
				}
				return Macchine_List;
			}catch (SQLException e){
			}
		}
		return Macchine_List;
	}
	
	public static boolean UpdateMacchinaCS(Macchina_CS mCS, String targa){
    	String sql = "UPDATE macchina_cs SET targa = '" + mCS.getTarga() + "', id_modello = " + mCS.getId_modello() + ", citta = '" + mCS.getCitta() + "', provincia = '" + mCS.getProvincia() + "', nome_stazione_CS = '" + mCS.getNome_stazione_CS() + "', anno_acquisto = " + mCS.getAnno_acquisto() + ", scad_bollo = '" + Utils.TimeString.dataCalendarToString(mCS.getScad_bollo()) + "', scad_assicurazione = '" + Utils.TimeString.dataCalendarToString(mCS.getScad_assicurazione()) + "', scad_revisione = '" + Utils.TimeString.dataCalendarToString(mCS.getScad_revisione()) + "', km_totali = " + mCS.getKm_totali() + ", prenotabile = " + mCS.getPrenotabile() + " WHERE targa = '" + targa + "'";
    	return Query.doUpdate(sql);
    }
}
