package Entita;
import java.sql.Timestamp;
public class Tragitto_CP {
    public int id;
    public boolean fumatori;
    public int num_posti;
    public String note;
    public String citta_arrivo;
    public String provincia_arrivo;
    public String citta_partenza;
    public String provincia_partenza;
    public String localita_partenza;
    public String localita_arrivo;
    public String email_utente;
    public String targa_CP;
    public Timestamp tempo_partenza;
    public Timestamp tempo_arrivo;

    //constructor
    public Tragitto_CP(int newid, boolean newfumatori, int newnum_posti, String newnote, String newcitta_partenza, String newprovincia_partenza, String newcitta_arrivo, String newprovincia_arrivo, String newlocalita_partenza, String newlocalita_arrivo, String newemail_utente, String newtarga_CP, Timestamp newtempo_partenza, Timestamp newtempo_arrivo) {
     id = newid;
     fumatori = newfumatori;
     num_posti = newnum_posti;
     note = newnote;
     citta_partenza = newcitta_partenza;
     provincia_partenza = newprovincia_partenza;
     citta_arrivo = newcitta_arrivo;
     provincia_arrivo = newprovincia_arrivo;
     localita_arrivo = newlocalita_arrivo;
     localita_partenza = newlocalita_partenza;
     email_utente = newemail_utente;
     targa_CP = newtarga_CP;
     tempo_partenza = newtempo_partenza;
     tempo_arrivo = newtempo_arrivo;
    }

    public void setId(int newValue) {
        id = newValue;
    }

    public void setFumatori(boolean newValue) {
        fumatori = newValue;
    }

    public void setNum_posti(int newValue) {
        num_posti = newValue;
    }
    
    public void setNote(String newValue) {
        note = newValue;
    }

    public void setCitta_partenza(String newValue) {
        citta_partenza = newValue;
    }
    
    public void setProvincia_partenza(String newValue) {
        provincia_partenza = newValue;
    }

    public void setCitta_arrivo(String newValue) {
        citta_arrivo = newValue;
    }
    
    public void setProvincia_arrivo(String newValue) {
        provincia_arrivo = newValue;
    }
    
    public void setLocalita_partenza(String newValue) {
        localita_partenza = newValue;
    }

    public void setLocalita_arrivo(String newValue) {
        localita_arrivo = newValue;
    }

    public void setEmail_utente(String newValue) {
        email_utente = newValue;
    }
    
    public void setTarga_CP(String newValue) {
        targa_CP = newValue;
    }

    public void setTempo_partenza(Timestamp newValue) {
        tempo_partenza = newValue;
    }

    public void setTempo_arrivo(Timestamp newValue) {
        tempo_arrivo  = newValue;
    }

    public int getId() {
        return id;
    }

    public boolean getFumatori() {
        return fumatori;
    }

    public int getNum_posti() {
        return num_posti;
    }
    
    public String getNote() {
        return note;
    }

    public String getCitta_partenza() {
        return citta_partenza;
    }

    public String getProvincia_partenza() {
        return provincia_partenza;
    }
    
    public String getCitta_arrivo() {
        return citta_arrivo;
    }

    public String getProvincia_arrivo() {
        return provincia_arrivo;
    }
    
    public String getLocalita_partenza() {
        return localita_partenza;
    }

    public String getLocalita_arrivo() {
        return localita_arrivo;
    }

    public String getEmail_utente() {
        return email_utente;
    }
    
    public String getTarga_CP() {
        return targa_CP;
    }

    public Timestamp getTempo_partenza() {
        return tempo_partenza;
    }

    public Timestamp getTempo_arrivo() {
        return tempo_arrivo;
    }
}
