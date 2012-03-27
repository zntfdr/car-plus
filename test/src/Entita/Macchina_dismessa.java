package Entita;

import java.sql.Timestamp;

public class Macchina_dismessa {
	public String targa;
    public String causa;
	public Timestamp data;

	public Macchina_dismessa(String newtarga, String newcausa, Timestamp newdata)
	{
		targa = newtarga;
		causa = newcausa;
		data = newdata;
	}
	
	public void setTarga(String newt)
	{
		targa = newt;
		
	}

	public void setCausa(String newc)
	{
		causa = newc;
		
	}
	public void setData(Timestamp newd)
	{
		data = newd;
		
	}
	

	public String getTarga() {
		return targa;
	}
	
	public String getCausa() {
		return causa;
	}
	
	public Timestamp getData() {
		return data;
	}
	

}