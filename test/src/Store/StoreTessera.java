package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Tessera;
import Entita.Tragitto_CP;
import Utils.*;

public class StoreTessera{
    public static void insertTessera(Tessera tess){
        String sql = "INSERT INTO tessera(id_contratto) VALUES(" +tess.getId_contratto()+")";

      Query.doQuery(sql);
    }

    public static Tessera readTessera(int id){
        String sql = "SELECT * FROM tessera WHERE id = " + id;
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
    
    public static ArrayList<Tessera> getTesseraFromContratto(int idContratto){
    	String sql = "SELECT * FROM tessera WHERE id_contratto = " + idContratto;
    	ResultSet rs = Query.doQueryRS(sql);
    	if(rs != null){
			try {
				ArrayList<Tessera> listaTessere = new ArrayList<Tessera>();
				while(rs.next()){
					listaTessere.add(new Tessera(rs.getInt("id"), rs.getInt("id_contratto")));
				}
				return listaTessere;
			}catch (SQLException e){
			}
		}
		return null;
    }
}
