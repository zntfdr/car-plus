package Entita;
import java.util.Calendar;

public class Guasto {	
	private int id;
    private int id_tragitto;
    private String danno;
    private String causa;
    private Calendar data_invio_riparazione;
    private Calendar data_segnalazione;
    private Boolean grave;
    
    public Guasto(int newid, int newid_tragitto, String newdanno, String newcausa, Calendar newdata_rip, Calendar newdata_seg, Boolean newgrave) {
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
    
    public void setData_invio_segnalazione(Calendar newValue) {
        data_invio_riparazione = newValue;
    }
    
    public void setData_segnalazione(Calendar newValue) {
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
    
    public String getDanno() {
        return danno;
    }
    
    public String getCausa() {
        return causa;
    }
    
    public Calendar getData_invio_riparazione() {
    	return data_invio_riparazione;
    }
    
    public Calendar getData_segnalazione() {
    	return data_segnalazione;
    }
    
    public Boolean getGrave() {
    	return grave;
    }
}
