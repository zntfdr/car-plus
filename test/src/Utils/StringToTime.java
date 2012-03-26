package Utils;
import java.util.Calendar;

public class StringToTime {

public static Calendar data(String dat){
	String[] dataArray = new String[dat.split("/").length];
	int anno = Integer.parseInt(dataArray[2]);
	int mese = Integer.parseInt(dataArray[1]);
	int giorno = Integer.parseInt(dataArray[0]);
	Calendar date = Calendar.getInstance();
	date.set(anno, mese, giorno);
	return date;
}
public static Calendar dataOra(String dat, int ore, int minuti){
	String[] dataArray = new String[dat.split("/").length];
	int anno = Integer.parseInt(dataArray[2]);
	int mese = Integer.parseInt(dataArray[1]);
	int giorno = Integer.parseInt(dataArray[0]);
	Calendar date = Calendar.getInstance();
	date.set(anno, mese, giorno, ore, minuti);
	return date;
}
}
