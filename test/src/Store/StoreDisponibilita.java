package Store;
import java.sql.*;
import java.util.ArrayList;

import Entita.Abbonamento;
import Entita.Disponibilita;
import Entita.Modello_Macchina;
import Entita.Tragitto_CP;
import Utils.*;

public class StoreDisponibilita{	
	public static boolean insertDisponibilita(Disponibilita dis){
		String sql = "INSERT INTO disponibilita(modello_macchina, nome_abbonamento) VALUES('" + dis.getModello() + "', '" + dis.getNome_abb() +"')";
		return Query.doUpdate(sql);
	}

	public static  ArrayList<Disponibilita> readDisponibilita(String nome){
		String sql = "SELECT * FROM disponibilita WHERE nome_abbonamento = '" + nome + "'";
		ArrayList<Disponibilita> listaModelli = new ArrayList<Disponibilita>();
		ResultSet rs = null;
		try {
			rs = Query.doQueryRS(sql);
			if(rs != null){
				while(rs.next()){
					listaModelli.add(new Disponibilita(rs.getInt("modello_macchina"), rs.getString("nome_abbonamento")));
				}
					rs.close();
					return listaModelli;
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
		return listaModelli;
	}
	
	public static boolean updateDisponibilita(Disponibilita disp, Disponibilita oldDisp){
		String sql = "UPDATE disponibilita SET modello_macchina = '" + disp.getModello() + "', nome_abbonamento = '" + disp.getNome_abb() + "' WHERE modello_macchina='" + oldDisp.getModello() +"' AND nome_abbonamento='" + oldDisp.getNome_abb() + "'";
		return Query.doUpdate(sql);
	}
	
	public static boolean deleteDisponibilita(Disponibilita disp) {
		String sql_query = "DELETE FROM disponibilita WHERE modello_macchina = '" + disp.getModello() + "' AND nome_abbonamento='" + disp.getNome_abb() +"'";
		return Query.doUpdate(sql_query);
	}

}
