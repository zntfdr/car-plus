package Store;
import java.sql.*;
import java.util.ArrayList;
import Entita.*;
import Utils.*;

public class StoreTragitto_CP{
	public static boolean insertTragitto_CP(Tragitto_CP value){
		String sql = "INSERT INTO tragitto_CP(fumatori, num_posti, note, citta_partenza, provincia_partenza, citta_arrivo, provincia_arrivo, email_utente, targa_CP, tempo_partenza, tempo_arrivo) VALUES(" + value.getFumatori() + "," + value.getNum_posti() + ",'" + value.getNote().replace("'", "''") + "','" + value.getCitta_partenza().replace("'", "''") + "','" + value.getProvincia_partenza().replace("'", "''") + "','" + value.getCitta_arrivo().replace("'", "''") + "','" + value.getProvincia_arrivo().replace("'", "''") + "','" + value.getEmail_utente() + "','" + value.getTarga_CP() + "','" + Utils.TimeString.dataOraCalendarToString(value.getTempo_partenza()) + "','" + Utils.TimeString.dataOraCalendarToString(value.getTempo_arrivo()) + "')";
		return Query.doUpdate(sql);
	}

	public static Tragitto_CP readTragitto_CP(int id){
		String sql = "SELECT * FROM tragitto_CP WHERE id = '" + id + "'";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Tragitto_CP(rs.getInt("id"), rs.getBoolean("fumatori"), rs.getInt("num_posti"), rs.getString("note"), rs.getString("citta_partenza"), rs.getString("provincia_partenza"), rs.getString("citta_arrivo"), rs.getString("provincia_arrivo"), rs.getString("email_utente"), rs.getString("targa_CP"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_partenza")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_arrivo")));
				}
			}
		}catch (SQLException e){
		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
			} finally {
				rs = null;
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
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				ArrayList<Tragitto_CP> Tragitto_CP_List = new ArrayList<Tragitto_CP>();
				while(rs.next()){
					Tragitto_CP_List.add(new Tragitto_CP(rs.getInt("id"), rs.getBoolean("fumatori"), rs.getInt("num_posti"), rs.getString("note"), rs.getString("citta_partenza"), rs.getString("provincia_partenza"), rs.getString("citta_arrivo"), rs.getString("provincia_arrivo"), rs.getString("email_utente"), rs.getString("targa_cp"), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_partenza")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("tempo_arrivo"))));
				}
				return Tragitto_CP_List;
			}
		}catch (SQLException e){
		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
			} finally {
				rs = null;
			}
		}
		return null;
	}
	
	public static ArrayList<Tragitto_CP> getAllTragittiCP() {
		String sql = "SELECT id FROM tragitto_CP";
		ResultSet rs = Query.doQueryRS(sql);

		if(rs != null){
			try {
				ArrayList<Integer> listaIDTragitto = new ArrayList<Integer>();
				while(rs.next()){
					listaIDTragitto.add(rs.getInt("id"));
				}
				if(!listaIDTragitto.isEmpty()){
					ArrayList<Tragitto_CP> listaTragitti_CP = Store.StoreTragitto_CP.readTragitto_CP_List(listaIDTragitto);
					return listaTragitti_CP;
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
}
