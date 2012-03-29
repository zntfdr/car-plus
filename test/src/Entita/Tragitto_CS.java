package Entita;
import java.util.Calendar;

public class Tragitto_CS {	
	private int id;
    private int id_tessera;
    private String targa_CS;
    private Calendar tempo_prelievo;
    private Calendar tempo_consegna;
    private Calendar tempo_prelievo_prenotazione;
    private Calendar tempo_consegna_prenotazione;
    private int km_totali;
    private Boolean pagato;

    public Tragitto_CS(int newid, int newid_tessera, String newtarga_CS, Calendar newtempo_prelievo, Calendar newtempo_consegna, Calendar newtempo_prelievo_prenotazione, Calendar newtempo_consegna_prenotazione, int newkm_totali, Boolean newpagato) {
    	id = newid;
    	id_tessera = newid_tessera;
    	targa_CS = newtarga_CS;
    	tempo_prelievo = newtempo_prelievo;
    	tempo_consegna = newtempo_consegna;
    	tempo_prelievo_prenotazione = newtempo_prelievo_prenotazione;
    	tempo_consegna_prenotazione = newtempo_consegna_prenotazione;
    	km_totali = newkm_totali;
    	pagato = newpagato;
    }

    public void setId(int newValue) {
        id = newValue;
    }
    
    public void setId_tessera(int newValue) {
        id_tessera = newValue;
    }
    
    public void setTarga_CS(String newValue) {
        targa_CS = newValue;
    }
    
    public void setTempo_prelievo(Calendar newValue) {
        tempo_prelievo = newValue;
    }
    
    public void setTempo_consegna(Calendar newValue) {
        tempo_consegna = newValue;
    }
    
    public void setTempo_prelievo_prenotazione(Calendar newValue) {
        tempo_prelievo_prenotazione = newValue;
    }
    
    public void setTempo_consegna_prenotazione(Calendar newValue) {
        tempo_consegna_prenotazione = newValue;
    }
    
    public void setKm_totali(int newValue) {
        km_totali = newValue;
    }
    
    public void setPagato(Boolean newValue) {
        pagato = newValue;
    }

    public int getId() {
        return id;
    }
    
    public int getId_tessera() {
        return id_tessera;
    }
    
    public String getTarga_CS() {
        return targa_CS;
    }
    
    public Calendar getTempo_prelievo() {
        return tempo_prelievo;
    }
    
    public Calendar getTempo_consegna() {
    	return tempo_consegna;
    }
    
    public Calendar getTempo_prelievo_prenotazione() {
    	return tempo_prelievo_prenotazione;
    }
    
    public Calendar getTempo_consegna_prenotazione() {
    	return tempo_consegna_prenotazione;
    }
    
    public int getKm_totali() {
    	return km_totali;
    }
    
    public Boolean getPagato() {
    	return pagato;
    }
}
