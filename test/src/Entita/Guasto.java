package Entita;
import java.sql.Timestamp;
public class Guasto {	
	public int id;
    public int id_tragitto;
    public String danno;
    public String causa;
    public Timestamp data_invio_riparazione;
    public Timestamp data_segnalazione;
    public Boolean grave;
    
    //constructor
    public Tragitto_CS(int newid, int newid_tragitto, String newdanno, String newcausa, Timestamp newdata_rip, Timestamp newdata_seg, Boolean newgrave) {
    
     id = newid;
     id_tragitto = newid_tragitto;
     danno = newdanno;
     causa = newcausa;
     data_invio_riparazione = newdata_rip;
     data_segnalazione = newdata_seg;
     grave = newgrave;
    }

    public void setId(int newValue) {
        id = newValue;
    }
    
    public void setId_tragitto(int newValue) {
        id_tragitto = newValue;
    }
    
    public void setDanno(String newValue) {
        danno = newValue;
    }
    
    public void setCausa(String newValue) {
        causa = newValue;
    }
    
    public void setData_invio_segnalazione(Timestamp newValue) {
        data_invio_riparazione = newValue;
    }
    
    public void setData_segnalazione(Timestamp newValue) {
        data_segnalazione = newValue;
    }
    
    
    public void setGrave(Boolean newValue) {
        grave = newValue;
    }

    public int getId() {
        return id;
    }
    
    public int getId_tragitto() {
        return id_tragitto;
    }
    
    public String getDanno {
        return danno;
    }
    
    public String getCausa {
        return causa;
    }
    
    public Timestamp getData_invio_riparazione() {
    	return data_invio_riparazione;
    }
    
    public Timestamp getData_segnalazione() {
    	return data_segnalazione;
    }
    
    public Boolean getGrave() {
    	return grave;
    }
}
