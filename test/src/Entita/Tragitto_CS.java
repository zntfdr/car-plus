package Entita;
import java.sql.Timestamp;
public class Tragitto_CS {	
	public int id;
    public int id_tessera;
    public String targa_CS;
    public Timestamp tempo_prelievo;
    public Timestamp tempo_consegna;
    public Timestamp tempo_prelievo_prenotazione;
    public Timestamp tempo_consegna_prenotazione;
    public int km_totali;
    public Boolean pagato;
    
    //constructor
    public Tragitto_CS(int newid, int newid_tessera, String newtarga_CS, Timestamp newtempo_prelievo, Timestamp newtempo_consegna, Timestamp newtempo_prelievo_prenotazione, Timestamp newtempo_consegna_prenotazione, int newkm_totali, Boolean newpagato) {
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
    
    public void setTempo_prelievo(Timestamp newValue) {
        tempo_prelievo = newValue;
    }
    
    public void setTempo_consegna(Timestamp newValue) {
        tempo_consegna = newValue;
    }
    
    public void setTempo_prelievo_prenotazione(Timestamp newValue) {
        tempo_prelievo_prenotazione = newValue;
    }
    
    public void setTempo_consegna_prenotazione(Timestamp newValue) {
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
    
    public Timestamp getTempo_prelievo() {
        return tempo_prelievo;
    }
    
    public Timestamp getTempo_consegna() {
    	return tempo_consegna;
    }
    
    public Timestamp getTempo_prelievo_prenotazione() {
    	return tempo_prelievo_prenotazione;
    }
    
    public Timestamp getTempo_consegna_prenotazione() {
    	return tempo_consegna_prenotazione;
    }
    
    public int getKm_totali() {
    	return km_totali;
    }
    
    public Boolean getPagato() {
    	return pagato;
    }
}
