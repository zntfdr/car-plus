package Store;
import java.sql.*;
import java.util.ArrayList;
import Entita.*;
import Utils.*;

public class StoreTragitto_CP{
	public static boolean insertTragitto_CP(Tragitto_CP value){
		String sql = "INSERT INTO tragitto_CP(fumatori, num_posti, note, citta_partenza, provincia_partenza, citta_arrivo, provincia_arrivo, email_utente, targa_CP, tempo_partenza, tempo_arrivo) VALUES(" + value.getFumatori() + "," + value.getNum_posti() + ",'" + value.getNote() + "','" + value.getCitta_partenza() + "','" + value.getProvincia_partenza() + "','" + value.getCitta_arrivo() + "','" + value.getProvincia_arrivo() + "','" + value.getEmail_utente() + "','" + value.getTarga_CP() + "','" + Utils.TimeString.dataOraCalendarToString(value.getTempo_partenza()) + "','" + Utils.TimeString.dataOraCalendarToString(value.getTempo_arrivo()) + "')";
		return Query.doUpdate(sql);
	}

	public static Tragitto_CP readTragitto_CP(int id){
		String sql = "SELECT * FROM tragitto_CP WHERE id = '" + id + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Tragitto_CP(rs.getInt("id"), rs.getBoolean("fumatori"), rs.getInt("num_posti"), rs.getString("note"), rs.getString("citta_partenza"), rs.getString("provincia_partenza"), rs.getString("citta_arrivo"), rs.getString("provincia_arrivo"), rs.getString("email_utente"), rs.getString("targa_CP"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_partenza")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_arrivo")));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}

	public static ArrayList<Tragitto_CP> readTragitto_CP_List(ArrayList<Integer> idList){
		String sql = "SELECT * FROM tragitto_CP WHERE ";
		for (int i=0; i<idList.size() - 1; i++){
			sql += "id = '" + idList.get(i)+ "' OR ";
		}
		sql+= "id = '" + idList.get(idList.size() - 1)+ "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				ArrayList<Tragitto_CP> Tragitto_CP_List = new ArrayList<Tragitto_CP>();
				while(rs.next()){
					Tragitto_CP_List.add(new Tragitto_CP(rs.getInt("id"), rs.getBoolean("fumatori"), rs.getInt("num_posti"), rs.getString("note"), rs.getString("citta_partenza"), rs.getString("provincia_partenza"), rs.getString("citta_arrivo"), rs.getString("provincia_arrivo"), rs.getString("email_utente"), rs.getString("targa_cp"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_partenza")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_arrivo"))));
				}
				return Tragitto_CP_List;
			}catch (SQLException e){
			}
		}
		return null;
	}
}
