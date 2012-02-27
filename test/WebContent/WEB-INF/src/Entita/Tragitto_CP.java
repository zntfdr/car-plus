package Entita;
import java.sql.Timestamp;
public class Tragitto_CP {
    public int id;
    public boolean fumatori;
    public int num_posti;
    public String note;
    public int id_localita_partenza;
    public int id_localita_arrivo;
    public String localita_partenza;
    public String localita_arrivo;
    public int cu_utente;
    public String targa_CP;
    public Timestamp tempo_partenza;
    public Timestamp tempo_arrivo;

    //constructor
    public Tragitto_CP(int newid, boolean newfumatori, int newnum_posti, String newnote, int newid_localita_partenza, int newid_localita_arrivo, int newcu_utente, String newtarga_CP, Timestamp newtempo_partenza, Timestamp newtempo_arrivo) {
     id = newid;
     fumatori = newfumatori;
     num_posti = newnum_posti;
     note = newnote;
     id_localita_partenza = newid_localita_partenza;
     id_localita_arrivo = newid_localita_arrivo;
     cu_utente = newcu_utente;
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

    public void setId_localita_partenza(int newValue) {
        id_localita_partenza = newValue;
    }

    public void setId_localita_arrivo(int newValue) {
        id_localita_arrivo = newValue;
    }
    public void setLocalita_partenza(String newValue) {
        localita_partenza = newValue;
    }

    public void setLocalita_arrivo(String newValue) {
        localita_arrivo = newValue;
    }

    public void setCu_utente(int newValue) {
        cu_utente = newValue;
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

    public int getId_localita_partenza() {
        return id_localita_partenza;
    }

    public int getId_localita_arrivo() {
        return id_localita_arrivo;
    }

    public String getLocalita_partenza() {
        return localita_partenza;
    }

    public String getLocalita_arrivo() {
        return localita_arrivo;
    }

    public int getCu_utente() {
        return cu_utente;
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
