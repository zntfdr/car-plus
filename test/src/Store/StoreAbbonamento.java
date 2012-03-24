package Store;
import java.sql.*;
import Entita.Abbonamento;
import Utils.*;

public class StoreAbbonamento{
	public static Abbonamento insertAbbonamento(Abbonamento abb){
		String sql = "INSERT INTO abbonamento(nome, descrizione, tariffa_magg_100km, tariffa_min_100km, tariffa_notturna, tariffa_diurna, costo_mensile, num_max_tessere, num_min_tessere) VALUES('" + abb.getNome() + "', '" + abb.getDescrizione() + "', '" + abb.getTariffa_magg_100km() + "', '" + abb.getTariffa_min_100km()  + "', '" + abb.getTariffa_notturna()  + "', '" + abb.getTariffa_diurna() +  "', '" + abb.getCosto_mensile()  + "', '" + abb.getNum_max_tessere()  + "', '" + abb.getNum_min_tessere() +"')";
	    
		Query.doQuery(sql);
		return readAbbonamento(abb.getNome());
	}

	public static Abbonamento readAbbonamento(String nome){
		String sql = "SELECT * FROM abbonamento WHERE nome = '" + nome + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Abbonamento(rs.getString("nome"), rs.getString("descrizione"), rs.getDouble("tariffa_magg_100km"), rs.getDouble("tariffa_min_100km"), rs.getDouble("tariffa_notturna"), rs.getDouble("tariffa_diurna"), rs.getDouble("costo_mensile"), rs.getInt("num_max_tessere"), rs.getInt("num_min_tessere"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
}
