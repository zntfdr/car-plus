package Store;
import java.sql.*;
import Entita.*;
import Utils.*;

public class StoreTragitto_CP{
    public static Tragitto_CP insertTragitto_CP(Tragitto_CP value){
        String sql = "INSERT INTO tragitto_CP(fumatori, num_posti, note, id_localita_partenza, id_localita_arrivo, cu_utente, targa_CP, tempo_partenza, tempo_arrivo) VALUES('" + value.getFumatori() + "','" + value.getNum_posti() + "','" + value.getNote() + "','" + value.getId_localita_partenza() + "','" + value.getId_localita_arrivo() + "','" + value.getCu_utente() + "','" + value.getTarga_CP() + "','" + value.getTempo_partenza() + "','" + value.getTempo_arrivo() + "')";

      Query.doQuery(sql);
      return readTragitto_CP(value.getId());
    }

    public static Tragitto_CP readTragitto_CP(int id){
        String sql = "SELECT * FROM tragitto_CP WHERE id = '" + id + "'";
        ResultSet rs = Query.doQueryRS(sql);
        if(rs != null){
            try {
                while(rs.next()){
                    return new Tragitto_CP(rs.getInt("id"), rs.getBoolean("fumatori"), rs.getInt("num_posti"), rs.getString("note"), rs.getInt("id_localita_partenza"), rs.getInt("id_localita_arrivo"), rs.getInt("cu_utente"), rs.getString("targa_CP"), rs.getTimestamp("tempo_partenza"), rs.getTimestamp("tempo_arrivo"));
                }
            }catch (SQLException e){
                }
            }
        return null;
    }
}
