package Entita;

public class Modello_Macchina {
    private int id;
    private String marca;
    private String modello;
    private int cilindrata;
    private int anno;
    private String alimentazione;
    private int emissioni_co2;
    private int num_posti;
    
    public Modello_Macchina(int newid, String newmarca, String newmodello, int newcilindrata, int newanno, String newalimentazione, int newemissioni_co2, int newnum_posti) {
        id = newid;
        marca = newmarca;
        modello = newmodello;
    	cilindrata = newcilindrata;
        anno = newanno;
        alimentazione = newalimentazione;
        emissioni_co2 = newemissioni_co2;
        num_posti = newnum_posti;
    }

    public void setId(int newValue) {
       id = newValue;
    }

    public void setMarca(String newValue) {
        marca = newValue;
    }
    
    public void setModello(String newValue) {
        modello = newValue;
    }
    
    public void setCilindrata(int newValue) {
        cilindrata = newValue;
    }
    
    public void setAnno(int newValue) {
        anno = newValue;
    }

    public void setAlimentazione(String newValue) {
        alimentazione = newValue;
    }
    
    public void setEmissioni_co2(int newValue){
    	emissioni_co2 = newValue;
    }
    
    public void setNum_posti(int newValue){
    	num_posti = newValue;
    }

    public int getId() {
       return id;
    }
    
    public String getMarca() {
        return marca;
    }
    
    public String getModello() {
        return modello;
    }
    
    public int getCilindrata() {
        return cilindrata;
    }
    
    public int getAnno() {
        return anno;
    }
    
    public String getAlimentazione() {
        return alimentazione;
    }
    
    public int getEmissioni_co2() {
        return emissioni_co2;
    }
    
    public int getNum_posti() {
        return num_posti;
    }
}
