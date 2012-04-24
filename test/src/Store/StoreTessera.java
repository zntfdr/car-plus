package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Tessera;
import Entita.Tragitto_CP;
import Utils.*;

public class StoreTessera{
	public static boolean insertTessera(Tessera tess){
		String sql = "INSERT INTO tessera(id_contratto) VALUES(" +tess.getId_contratto()+")";

		return Query.doUpdate(sql);
	}

	public static Tessera readTessera(int id){
		String sql = "SELECT * FROM tessera WHERE id = " + id;
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Tessera(rs.getInt("id"),rs.getInt("id_contratto"));
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

	public static ArrayList<Tessera> getTesseraFromContratto(int idContratto){
		String sql = "SELECT * FROM tessera WHERE id_contratto = " + idContratto;
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				ArrayList<Tessera> listaTessere = new ArrayList<Tessera>();
				while(rs.next()){
					listaTessere.add(new Tessera(rs.getInt("id"), rs.getInt("id_contratto")));
				}
				return listaTessere;
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
}
