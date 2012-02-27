package Entita;

public class Abbonamento {
    public String nome;
    public String descrizione;
    public Double tariffa_notturna;
    public Double tariffa_diurna;
    public Double tariffa_magg_100km;
    public Double tariffa_min_100km;
    public Int costo_mensile;
    public Int num_max_tessere;
    public Int num_min_tessere;
 
    public Abbonamento(String newnome, String newdescrizione, Double newtariffa_notturna, Double newtariffa_diurna, Double newtariffa_magg_100km, Double newtariffa_min_100km, Int newcosto_mensile, Int newnum_max_tessere, Int newnum_min_tessere)
    {
     nome = newnome;
     descrizione = newdescrizione;
     tariffa_notturna = newtariffa_notturna; 
     tariffa_diurna = newtariffa_diurna; 
     tariffa_magg_100km = newtariffa_magg_100km;
     tariffa_min_100km = newtariffa_min_100km;
     costo_mensile = newcosto_mensile; 
     num_max_tessere = newnum_max_tessere; 
     num_min_tessere = newnum_min_tessere;
    }

    public void setNome(String newValue) {
        nome = newValue;
    }

    public void setDescrizione(String newValue) {
        descrizione = newValue;
    }

    public void setTariffa_notturna(Double newValue) {
        tariffa_notturna = newValue;
    }

    public void setTariffa_diurna(Double newValue) {
        tariffa_diurna = newValue;
    }

    public void setTariffa_magg_100km(Double newValue) {
        tariffa_magg_100km = newValue;
    }

    public void setTariffa_min_100km(Double newValue) {
        tariffa_min_100km = newValue;
    }

    public void setCosto_mensile(Int newValue) {
        costo_mensile = newValue;
    }

    public void setNum_max_tessere(Int newValue) {
        num_max_tessere = newValue;
    }

    public void setNum_min_tessere(Int newValue) {
        num_min_tessere = newValue;
    }

    public String getNome() {
        return nome;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public double getTariffa_notturna() {
        return tariffa_notturna;
    }

    public double getTariffa_diurna() {
        return tariffa_diurna;
    }

    public double getTariffa_magg_100km() {
        return tariffa_magg_100km;
    }

    public double getTariffa_min_100km() {
        return tariffa_min_100km;
    }

    public double getCosto_mensile() {
        return costo_mensile;
    }

    public int getNum_max_tessere() {
        return num_max_tessere;
    }

    public int getNum_min_tessere() {
        return num_min_tessere;
    }
}
}