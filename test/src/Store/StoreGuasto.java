package Store;
import java.sql.*;

import Entita.Guasto;
import Utils.*;

public class StoreGuasto{
	public static boolean insertGuasto(Guasto gst){
		String sql = "INSERT INTO guasto(id_tragitto_CS,danno,causa,data_invio_riparazione, data_segnalazione,grave) VALUES(" + gst.getId_tragitto() + ",'" + gst.getDanno().replace("'", "''") + "','" + gst.getCausa().replace("'", "''") + "','"+ gst.getData_invio_riparazione() +"','"+gst.getData_segnalazione() + "'," + gst.getGrave() + ")";

		return Query.doUpdate(sql);
	}

	public static Guasto readGuasto(int id){
		String sql = "SELECT * FROM guasto WHERE id = " + id;
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					return new Guasto(rs.getInt("id"),rs.getInt("id_tragitto"),rs.getString("danno").replace("'", "''"),rs.getString("causa").replace("'", "''"),Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("data_invio_riparazione")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("data_segnalazione")),rs.getBoolean("grave"));
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
}
