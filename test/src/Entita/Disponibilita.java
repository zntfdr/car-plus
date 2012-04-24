package Entita;

public class Disponibilita {
	private int modello_macchina;
    private String nome_abbonamento;

	public Disponibilita(int newmod, String newna){
		modello_macchina = newmod;
		nome_abbonamento = newna;
	}
	
	public void setModello(int mod){
		modello_macchina = mod;
	}
	
	public void setNome_abb(String na){
		nome_abbonamento = na;	
	}

	public int getModello() {
		return modello_macchina;
	}
	
	public String getNome_abb() {
		return nome_abbonamento;
	}
}