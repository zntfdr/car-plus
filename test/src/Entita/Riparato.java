package Entita;
import java.sql.Timestamp;
public class Riparato {	
    public int id_guasto;
    public String officina_riparazione;
    public Timestamp data_riparazione;
    public int costo_riparazione;
    
    //constructor
    public Riparato(int newid_guasto, String newofficina_riparazione, Timestamp newdata_rip, int newcosto_rip) {

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
    
    public void setData_riparazione(Timestamp newValue) {
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
    
    public Timestamp getData_riparazione() {
    	return data_riparazione;
    }
 
    public int getCosto_riparazione() {
    	return costo_riparazione;
    }
}
