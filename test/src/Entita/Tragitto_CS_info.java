package Entita;
import java.util.Calendar;

import Store.StoreAbbonamento;
import Store.StoreContratto;

public class Tragitto_CS_info extends Tragitto_CS {	
	private String nome;
    private String citta;
    private String provincia;
    private String marca;
    private String modello_macchina;    
    private int contratto;
    private String email_cliente;

    public Tragitto_CS_info(String newnome, String newcitta, String newprovincia, String newmarca, String newmodello, Calendar newtempo_prelievo, Calendar newtempo_consegna, Calendar newtempo_prelievo_prenotazione, Calendar newtempo_consegna_prenotazione, int newkm_totali, Boolean newpagato, int newid, int newtessera, int newcontratto, String newtarga, String newemail_cliente) {
    	super(newid,newtessera,newtarga,newtempo_prelievo,newtempo_consegna,newtempo_prelievo_prenotazione,newtempo_consegna_prenotazione,newkm_totali,newpagato);
    	nome = newnome;
    	citta = newcitta;
    	provincia = newprovincia;
    	marca = newmarca;
    	modello_macchina = newmodello;
    	contratto = newcontratto;
    	email_cliente = newemail_cliente;
    }

    public void setNome(String newnome) {
        nome = newnome;
    }
    
    public void setCitta(String newcitta) {
        citta = newcitta;
    }
    
    public void setProvincia(String newprovincia) {
        provincia = newprovincia;
    }
    
    public void setMarca(String newmarca) {
        marca = newmarca;
    }
    
    public void setModello_macchina(String newmodello_macchina) {
        modello_macchina = newmodello_macchina;
    }
    
   
    public void setContratto(int newcontratto) {
        contratto = newcontratto;
    }

    public void setEmail_cliente(String newemail_cliente) {
        email_cliente = newemail_cliente;
    }
    
    public String getNome() {
        return nome;
    }
    
    public String getCitta() {
        return citta;
    }
    
    public String getProvincia() {
        return provincia;
    }
    
    public String getMarca() {
        return marca;
    }
    
    public String getModello_macchina() {
        return modello_macchina;
    }
    
    public int getContratto() {
        return contratto;
    }
    
    public String getEmail_cliente() {
        return email_cliente;
    }
    
    public double getCosto(){
    	Calendar d = this.getTempo_consegna();
		if(d.get(d.YEAR)==1111){
    		return 0;
    	}
    	double costo;
    	double ore;
    	Contratto contratto = StoreContratto.readContratto(this.contratto);
    	Abbonamento abbonamento = StoreAbbonamento.readAbbonamento(contratto.getNome_abbonamento());
    	//prendi il tempo max tra consegna_prenotazione e consegna_reale
    	if(d.compareTo(this.getTempo_consegna_prenotazione()) > 0){
        	ore = (double)(d.getTimeInMillis()-this.getTempo_prelievo_prenotazione().getTimeInMillis())/(1000*3600);
    	} else {
        	ore = (double)(this.getTempo_consegna_prenotazione().getTimeInMillis()-this.getTempo_prelievo_prenotazione().getTimeInMillis())/(1000*3600);
    	}
    	//scegli se tariffa notturna (prelievo dalle 20.00 alle 6.00) o diurna
    	if(this.getTempo_prelievo().HOUR_OF_DAY<6 && this.getTempo_prelievo().HOUR_OF_DAY>20){
    		costo = ore * abbonamento.getTariffa_notturna();
    	} else {
    		costo = ore * abbonamento.getTariffa_diurna();
    	}
    	//scegli se usare la tariffa magg 100 km o min 100 km
    	if(this.getKm_totali()>100){
    		costo+=(this.getKm_totali()*abbonamento.getTariffa_magg_100km());
    	} else {
    		costo+=(this.getKm_totali()*abbonamento.getTariffa_min_100km());
    	}
    	return costo;
    }
}
