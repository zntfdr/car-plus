package Store;
import java.sql.*;
import Entita.Tessera;
import Utils.*;

public class StoreTessera{
    public static Tessera insertTessera(Tessera tess){
        String sql = "INSERT INTO tessera(id, id_contratto) VALUES(" + tess.getId() + "," + tess.getId_contratto() + ")";

      Query.doQuery(sql);
      return readTessera(tess.getId(),tess.getId_contratto());
    }

    public static Tessera readTessera(int id, int idc){
        String sql = "SELECT * FROM tessera WHERE id = " + id + " AND id_contratto = "+ idc;
        ResultSet rs = Query.doQueryRS(sql);
        if(rs != null){
            try {
                while(rs.next()){
                    return new Tessera(rs.getInt("id"),rs.getInt("id_contratto"));
                }
            }catch (SQLException e){
                }
            }
        return null;
    }
}
