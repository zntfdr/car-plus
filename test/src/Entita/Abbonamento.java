package Entita;

public class Abbonamento {
	public String nome;
	public String descrizione;
	public double tariffa_notturna;
	public double tariffa_diurna;
	public double tariffa_magg_100km;
	public double tariffa_min_100km;
	public double costo_mensile;
	public int num_max_tessere;
	public int num_min_tessere;

	public Abbonamento(String newnome, String newdescrizione, double newtariffa_notturna, double newtariffa_diurna, double newtariffa_magg_100km, double newtariffa_min_100km, double newcosto_mensile, int newnum_max_tessere, int newnum_min_tessere)
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

	public void setTariffa_notturna(double newValue) {
		tariffa_notturna = newValue;
	}

	public void setTariffa_diurna(double newValue) {
		tariffa_diurna = newValue;
	}

	public void setTariffa_magg_100km(double newValue) {
		tariffa_magg_100km = newValue;
	}

	public void setTariffa_min_100km(double newValue) {
		tariffa_min_100km = newValue;
	}

	public void setCosto_mensile(double newValue) {
		costo_mensile = newValue;
	}

	public void setNum_max_tessere(int newValue) {
		num_max_tessere = newValue;
	}

	public void setNum_min_tessere(int newValue) {
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