package Store;
import java.sql.*;
import Entita.*;
import Utils.*;

public class StoreTragitto_CP{
    public static Tragitto_CP insertTragitto_CP(Tragitto_CP value){
        String sql = "INSERT INTO tragitto_CP(fumatori, num_posti, note, citta_partenza, provincia_partenza, citta_arrivo, provincia_arrivo, localita_partenza, localita_arrivo, email_utente, targa_CP, tempo_partenza, tempo_arrivo) VALUES('" + value.getFumatori() + "','" + value.getNum_posti() + "','" + value.getNote() + "','" + value.getCitta_partenza() + "','" + value.getProvincia_partenza() + "','" + value.getCitta_arrivo() + "','" + value.getProvincia_arrivo() + "','" + value.getLocalita_partenza() + "','" + value.getLocalita_arrivo() + "','" + value.getEmail_utente() + "','" + value.getTarga_CP() + "','" + value.getTempo_partenza() + "','" + value.getTempo_arrivo() + "')";

      Query.doQuery(sql);
      return readTragitto_CP(value.getId());
    }

    public static Tragitto_CP readTragitto_CP(int id){
        String sql = "SELECT * FROM tragitto_CP WHERE id = '" + id + "'";
        ResultSet rs = Query.doQueryRS(sql);
        if(rs != null){
            try {
                while(rs.next()){
                    return new Tragitto_CP(rs.getInt("id"), rs.getBoolean("fumatori"), rs.getInt("num_posti"), rs.getString("note"), rs.getString("citta_partenza"), rs.getString("provincia_partenza"), rs.getString("citta_arrivo"), rs.getString("provincia_arrivo"), rs.getString("localita_partenza"), rs.getString("localita_arrivo"), rs.getString("email_utente"), rs.getString("targa_CP"), rs.getTimestamp("tempo_partenza"), rs.getTimestamp("tempo_arrivo"));
                }
            }catch (SQLException e){
                }
            }
        return null;
    }
}
