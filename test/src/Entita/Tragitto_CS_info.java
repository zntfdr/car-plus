package Entita;
import java.util.Calendar;

public class Tragitto_CS_info {	
	private String nome;
    private String citta;
    private String provincia;
    private String marca;
    private String modello_macchina;    
    private Calendar tempo_prelievo;
    private Calendar tempo_consegna;
    private Calendar tempo_prelievo_prenotazione;
    private Calendar tempo_consegna_prenotazione;
    private int km_totali;
    private Boolean pagato;

    public Tragitto_CS_info(String newnome, String newcitta, String newprovincia, String newmarca, String newmodello, Calendar newtempo_prelievo, Calendar newtempo_consegna, Calendar newtempo_prelievo_prenotazione, Calendar newtempo_consegna_prenotazione, int newkm_totali, Boolean newpagato) {
    	nome = newnome;
    	citta = newcitta;
    	provincia = newprovincia;
    	marca = newmarca;
    	modello_macchina = newmodello;
    	tempo_prelievo = newtempo_prelievo;
    	tempo_consegna = newtempo_consegna;
    	tempo_prelievo_prenotazione = newtempo_prelievo_prenotazione;
    	tempo_consegna_prenotazione = newtempo_consegna_prenotazione;
    	km_totali = newkm_totali;
    	pagato = newpagato;
    }

    public void setnome(String newnome) {
        nome = newnome;
    }
    
    public void setcitta(String newcitta) {
        citta = newcitta;
    }
    
    public void setprovincia(String newprovincia) {
        provincia = newprovincia;
    }
    
    public void setmarca(String newmarca) {
        marca = newmarca;
    }
    
    public void setmodello_macchina(String newmodello_macchina) {
        modello_macchina = newmodello_macchina;
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

    public String getnome() {
        return nome;
    }
    
    public String getcitta() {
        return citta;
    }
    
    public String getprovincia() {
        return provincia;
    }
    
    public String getmarca() {
        return marca;
    }
    
    public String getmodello_macchina() {
        return modello_macchina;
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
