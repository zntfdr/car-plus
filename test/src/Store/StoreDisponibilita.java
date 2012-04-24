package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Abbonamento;
import Entita.Disponibilita;
import Entita.Tragitto_CP;
import Utils.*;

public class StoreDisponibilita{	
	public static boolean insertDisponibilita(Disponibilita dis){
		String sql = "INSERT INTO disponibilita(modello_macchina, nome_abbonamento) VALUES('" + dis.getModello() + "', '" + dis.getNome_abb() +"')";
		return Query.doUpdate(sql);
	}

	public static  Disponibilita readDisponibilita(String nome){
		String sql = "SELECT * FROM disponibilita WHERE nome_abbonamento = '" + nome + "'";
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					Disponibilita disponibilita = new Disponibilita(rs.getInt("modello_macchina"), rs.getString("nome_abbonamento"));
					rs.close();
					return disponibilita;
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
