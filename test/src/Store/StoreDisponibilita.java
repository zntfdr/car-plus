package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Abbonamento;
import Entita.Disponibilita;
import Entita.Tragitto_CP;
import Utils.*;

public class StoreDisponibilita{	
	public static void insertDisponibilita(Disponibilita dis){
		String sql = "INSERT INTO disponibilita(modello_macchina, nome_abbonamento) VALUES('" + dis.getModello() + "', '" + dis.getNome_abb() +"')";
	  
		Query.doQuery(sql);
	}

	public static  Disponibilita readDisponibilita(String nome){
		String sql = "SELECT * FROM disponibilita WHERE nome_abbonamento = '" + nome + "'";
		ResultSet rs = Query.doQueryRS(sql);
		if(rs != null){
			try {
				while(rs.next()){
					return new Disponibilita(rs.getInt("modello_macchina"), rs.getInt("nome_abbonamento"));
				}
			}catch (SQLException e){
			}
		}
		return null;
	}
	

}
