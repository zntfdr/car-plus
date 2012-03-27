package Entita;

public class Disponibilita {
	public int modello_macchina;
    public int nome_abbonamento;

	public Disponibilita(int newmod, int newna)
	{
		modello_macchina = newmod;
		nome_abbonamento = newna;
	}
	
	public void setModello(int mod)
	{
		modello_macchina = mod;
		
	}
	
	public void setNome_abb(int na)
	{
		nome_abbonamento = na;
		
	}

	public int getModello() {
		return modello_macchina;
	}
	
	public int getNome_abb() {
		return nome_abbonamento;
	}

	

}