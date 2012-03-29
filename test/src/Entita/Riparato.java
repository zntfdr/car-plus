package Entita;
import java.util.Calendar;

public class Riparato {	
    private int id_guasto;
    private String officina_riparazione;
    private Calendar data_riparazione;
    private int costo_riparazione;
    
    public Riparato(int newid_guasto, String newofficina_riparazione, Calendar newdata_rip, int newcosto_rip) {
    	id_guasto = newid_guasto;
    	officina_riparazione = newofficina_riparazione;
    	data_riparazione = newdata_rip;
    	costo_riparazione = newcosto_rip;
    }
    
    public void setId_guasto(int newValue) {
        id_guasto = newValue;
    }
    
    public void setOfficina_riparazione(String newValue) {
        officina_riparazione = newValue;
    }
    
    public void setData_riparazione(Calendar newValue) {
        data_riparazione = newValue;
    }
    
    public void setCosto_riparazione(int newValue) {
        costo_riparazione = newValue;
    }
    
    public int getId_guasto() {
        return id_guasto;
    }
 
    public String getOfficina_riparazione() {
        return officina_riparazione;
    }
    
    public Calendar getData_riparazione() {
    	return data_riparazione;
    }
 
    public int getCosto_riparazione() {
    	return costo_riparazione;
    }
}
