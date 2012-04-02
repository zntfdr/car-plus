package Store;
import java.sql.*;
import Entita.Guasto;
import Utils.*;

public class StoreGuasto{
    public static Guasto insertGuasto(Guasto gst){
        String sql = "INSERT INTO guasto(id_tragitto_CS,danno,causa,data_invio_riparazione, data_segnalazione,grave) VALUES(" + gst.getId_tragitto() + ",'" + gst.getDanno() + "','" + gst.getCausa() + "','"+ gst.getData_invio_riparazione() +"','"+gst.getData_segnalazione() + "'," + gst.getGrave() + ")";

      Query.doQuery(sql);
      return readGuasto(gst.getId());
    }

    public static Guasto readGuasto(int id){
        String sql = "SELECT * FROM guasto WHERE id = " + id;
        ResultSet rs = Query.doQueryRS(sql);
        if(rs != null){
            try {
                while(rs.next()){
                    return new Guasto(rs.getInt("id"),rs.getInt("id_tragitto"),rs.getString("danno"),rs.getString("causa"),Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("data_invio_riparazione")), Utils.TimeString.parseSQLTimestampToCalendar(rs.getString("data_segnalazione")),rs.getBoolean("grave"));
                }
            }catch (SQLException e){
                }
            }
        return null;
    }
}
