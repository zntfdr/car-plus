package Entita;
import java.util.Calendar;

public class Macchina_CS {    
    private String targa;
    private int id_modello;
    private String citta;
    private String provincia;
    private String nome_stazione_CS;
    private int anno_acquisto;
    private Calendar scad_bollo;
    private Calendar scad_assicurazione;
    private Calendar scad_revisione;
    private int km_totali;
    private Boolean prenotabile;

    public Macchina_CS(String newtarga, int newid_modello, String newcitta, String newprovincia, String newnome_stazione_CS, int newanno_acquisto, Calendar newscad_bollo, Calendar newscad_assicurazione, Calendar newscad_revisione, int newkm_totali, Boolean newprenotabile) {
        targa = newtarga;
        id_modello = newid_modello;
        citta = newcitta;
        provincia = newprovincia;
        nome_stazione_CS = newnome_stazione_CS;
        anno_acquisto = newanno_acquisto;
        scad_bollo = newscad_bollo;
        scad_assicurazione = newscad_assicurazione;
        scad_revisione = newscad_revisione;
        km_totali = newkm_totali;
        prenotabile = newprenotabile;
    }

    public void setTarga(String newValue) {
       targa = newValue;
    }

    public void setId_modello(int newValue) {
    	id_modello = newValue;
    }
    
    public void setCitta(String newValue) {
    	citta = newValue;
    }
    
    public void setProvincia(String newValue) {
    	provincia = newValue;
    }
    
    public void setNome_stazione_CS(String newValue) {
    	nome_stazione_CS = newValue;
    }
    
    public void setAnno_aquisto(int newValue) {
    	anno_acquisto = newValue;
    }
    
    public void setScad_bollo(Calendar newValue) {
    	scad_bollo= newValue;
    }
    
    public void setScad_assicurazione(Calendar newValue) {
    	scad_assicurazione = newValue;
    }
    
    public void setScad_revisione(Calendar newValue) {
    	scad_revisione = newValue;
    }
    
    public void setKm_totali(int newValue) {
    	km_totali = newValue;
    }
    
    public void setPrenotabile(Boolean newValue) {
    	prenotabile = newValue;
    }
    
    public String getTarga() {
       return targa;
    }
    
    public int getId_modello() {
        return id_modello;
    }

    public String getCitta() {
    	return citta;
    }
    
    public String getProvincia() {
    	return provincia;
    }
    
    public String getNome_stazione_CS() {
    	return nome_stazione_CS;
    }
    
    public int getAnno_acquisto() {
        return anno_acquisto;
    }
    
    public Calendar getScad_bollo() {
        return scad_bollo;
    }
        
    public Calendar getScad_assicurazione() {
        return scad_assicurazione;
    }
        
    public Calendar getScad_revisione() {
        return scad_revisione;
    }
    
    public int getKm_totali() {
        return km_totali;
    }
    
    public Boolean getPrenotabile() {
        return prenotabile;
    } 
}
