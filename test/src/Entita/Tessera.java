package Entita;
import java.sql.Timestamp;

public class Tessera {
	public int id;
    public int id_contratto;

	public Tessera(int newid, int newid_c)
	{
		id = newid;
		id_contratto = newid_c;
	}
	
	public void setContratto(int id_c)
	{
		id_contratto = id_c;
		
	}

	public int getId() {
		return id;
	}
	
	public int getContratto() {
		return id_contratto;
	}

	

}