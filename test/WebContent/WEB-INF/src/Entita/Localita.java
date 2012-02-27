package Entita;

public class Localita {
    public int id;
    public String regione;
    public String provincia;
    public String citta;

    //constructor
    public Localita(int newid, String newregione, String newprovincia, String newcitta) {
        id = newid;
        regione = newregione;
        provincia = newprovincia;
        citta = newcitta;
    } 

    public int getId(){
        return id;
    }

    public String getRegione() {
       return regione;
    }

    public String getProvincia() {
       return provincia;
    }

    public String getCitta() {
       return citta;
    }

    public void setRegione(String newValue) {
       regione = newValue;
    }

    public void setProvincia(String newValue) {
       provincia = newValue;
    }

    public void setCitta(String newValue) {
       citta = newValue;
    }

    public void setId(int newValue){
        id = newValue;
    }
}