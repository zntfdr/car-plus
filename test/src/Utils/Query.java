package Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.rowset.*;
import com.sun.rowset.CachedRowSetImpl;

public class Query {

	public static String erroreSQL = "";
	
	public static boolean doQuery(String sql)	// sql = l'interrogazione da effettuare
	{

		// connessione al DBMS
		Connection con = null;

		// lo statement da eseguire
		PreparedStatement pstmt = null;

		// i risultati dell'esecuzione dello statement;
		ResultSet rs = null;

		// Il nome del driver da utilizzare per connettersi al database
		String driver = "org.postgresql.Driver";

		// Il database a cui connettersi
		String database = "dbstud.dei.unipd.it";

		// l'utente da utilizzare
		String user = "EcoGuys";

		// la password per quell'utente
		String password = "vuiciexa";

		try {
			// Registra il driver per accedere al database
			Class.forName(driver);

			System.out.printf("Driver: %s registrato con successo.%n", driver);
		} catch (ClassNotFoundException e) {
			erroreSQL = e.getMessage();
			return false; //something went wrong, sorry buddy
		}

		try {

			// si connette al database

			con = DriverManager.getConnection("jdbc:postgresql://" + database,
					user, password);

			// crea la statement da utilizzare per effettuare l'interrogazione

			pstmt = con.prepareStatement(sql);

			// esegue l'interrogazione

			rs = pstmt.executeQuery();
			return true;

		} catch (SQLException e) {
			erroreSQL = e.getMessage();
			return false;

		} finally {
			try {

				// prova a chiudere gli oggetti aperti e rilascia le risorse
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}

			} catch (SQLException e) {
				erroreSQL = e.getMessage();
				return false;

			} finally {

				// rilascia completamente le risorse per il garbage collector
				rs = null;
				pstmt = null;
				con = null;

			}
		}

	}
	
	public static boolean doUpdate(String sql)	// sql = l'interrogazione da effettuare
	{

		// connessione al DBMS
		Connection con = null;

		// lo statement da eseguire
		PreparedStatement pstmt = null;

		// Il nome del driver da utilizzare per connettersi al database
		String driver = "org.postgresql.Driver";

		// Il database a cui connettersi
		String database = "dbstud.dei.unipd.it";

		// l'utente da utilizzare
		String user = "EcoGuys";

		// la password per quell'utente
		String password = "vuiciexa";

		try {
			// Registra il driver per accedere al database
			Class.forName(driver);

			System.out.printf("Driver: %s registrato con successo.%n", driver);
		} catch (ClassNotFoundException e) {
			erroreSQL = e.getMessage();
			return false; //something went wrong, sorry buddy
		}

		try {

			// si connette al database

			con = DriverManager.getConnection("jdbc:postgresql://" + database,
					user, password);

			// crea la statement da utilizzare per effettuare l'interrogazione

			pstmt = con.prepareStatement(sql);

			// esegue l'interrogazione

			pstmt.executeUpdate();
			return true;

		} catch (SQLException e) {
			erroreSQL = e.getMessage();
			return false;

		} finally {
			try {

				// prova a chiudere gli oggetti aperti e rilascia le risorse
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}

			} catch (SQLException e) {
				erroreSQL = e.getMessage();
				return false;

			} finally {

				// rilascia completamente le risorse per il garbage collector
				pstmt = null;
				con = null;

			}
		}

	}


public static ResultSet doQueryRS(String sql)
{
		// connessione al DBMS
		Connection con = null;

		// lo statement da eseguire
		PreparedStatement pstmt = null;

		// i risultati dell'esecuzione dello statement;
		ResultSet rs = null;

		// i risultati dell'esecuzione dello statement;
		ResultSet rsCopy = null;

		// Il nome del driver da utilizzare per connettersi al database
		String driver = "org.postgresql.Driver";

		// Il database a cui connettersi
		String database = "dbstud.dei.unipd.it";

		// l'utente da utilizzare
		String user = "EcoGuys";

		// la password per quell'utente
		String password = "vuiciexa";

		try {
			// Registra il driver per accedere al database
			Class.forName(driver);

			System.out.printf("Driver: %s registrato con successo.%n", driver);
		} catch (ClassNotFoundException e) {
			erroreSQL = e.getMessage();
			return null;
		}

		try {

			// si connette al database

			con = DriverManager.getConnection("jdbc:postgresql://" + database,
					user, password);

			// crea la statement da utilizzare per effettuare l'interrogazione

			pstmt = con.prepareStatement(sql);

			// esegue l'interrogazione

			rs = pstmt.executeQuery();

            CachedRowSetImpl copy = new CachedRowSetImpl();
            copy.populate(rs);

	          return copy.getOriginal();
		    } 
		catch (SQLException e) 
		{ 	
			erroreSQL = e.getMessage();
			return null; 
		}
		finally {
			try {
				// prova a chiudere gli oggetti aperti e rilascia le risorse
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}

			} catch (SQLException e) {
				erroreSQL = e.getMessage();
				return null;

			} finally {

				// rilascia completamente le risorse per il garbage collector
				rs = null;
				pstmt = null;
				con = null;
			}
		}

	}

}
