package Entita;
import java.util.Calendar;

public class Macchina_dismessa {
	private String targa;
    private String causa;
	private Calendar data;

	public Macchina_dismessa(String newtarga, String newcausa, Calendar newdata){
		targa = newtarga;
		causa = newcausa;
		data = newdata;
	}
	
	public void setTarga(String newt){
		targa = newt;
	}

	public void setCausa(String newc){
		causa = newc;
	}
	public void setData(Calendar newd){
		data = newd;
	}
	
	public String getTarga() {
		return targa;
	}
	
	public String getCausa() {
		return causa;
	}
	
	public Calendar getData() {
		return data;
	}
}