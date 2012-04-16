package Utils;
import java.util.Calendar;

public class TimeString {
	
	public static Calendar dataStringToCalendar(String dat){
		String[] dataArray  = {"0000", "00", "00"};
		if(dat.contains("/")){
			dataArray = dat.split("/");
		} else if (dat.contains("-")){
			dataArray = dat.split("-");
		}
		int anno = Integer.parseInt(dataArray[0]);
		int mese = Integer.parseInt(dataArray[1])-1;
		int giorno = Integer.parseInt(dataArray[2]);
		Calendar date = Calendar.getInstance();
		date.set(anno, mese, giorno);
		return date;
	}
	
	public static Calendar dataOraStringToCalendar(String dat, int ore, int minuti){
		String[] dataArray  = {"0000", "00", "00"};
		if(dat.contains("/")){
			dataArray = dat.split("/");
		} else if (dat.contains("-")){
			dataArray = dat.split("-");
		}
		int anno = Integer.parseInt(dataArray[0]);
		int mese = Integer.parseInt(dataArray[1])-1;
		int giorno = Integer.parseInt(dataArray[2]);
		Calendar date = Calendar.getInstance();
		date.set(anno, mese, giorno, ore, minuti, 0);
		return date;
	}
	
	public static Calendar parseSQLTimestampToCalendar(String dat){
		String[] timeStamp;
		Calendar date = Calendar.getInstance();
		date.set(0, 0, 0, 0, 0, 0);
		if(dat.contains(" ")){
			timeStamp = dat.split(" ");
			String[] dataArray = timeStamp[0].split("-");
			int anno = Integer.parseInt(dataArray[0]);
			int mese = Integer.parseInt(dataArray[1])-1;
			int giorno = Integer.parseInt(dataArray[2]);
			String[] oraArray = timeStamp[1].split(":");
			int ore = Integer.parseInt(oraArray[0]);
			int minuti = Integer.parseInt(oraArray[1]);
			date.set(anno, mese, giorno, ore, minuti, 0);
		} 
		return date;
	}
	
	public static String dataCalendarToString(Calendar cal){
		String date = "";
		int mese = cal.get(cal.MONTH) +1;
		date = cal.get(cal.YEAR) + "/" + duecifre(mese) + "/" + duecifre(cal.get(cal.DAY_OF_MONTH));
		return date;
	}
	
	public static String dataOraCalendarToString(Calendar cal){
		String date = "";
		int mese = cal.get(cal.MONTH) +1;
		date = cal.get(cal.YEAR) + "/" + duecifre(mese) + "/" + duecifre(cal.get(cal.DAY_OF_MONTH)) + " " + duecifre(cal.get(cal.HOUR_OF_DAY)) + ":" + duecifre(cal.get(cal.MINUTE)) + ":" + duecifre(cal.get(cal.SECOND));
		return date;
	}
	
	public static String duecifre(int numero)
	{
		if(numero<10)
			return "0"+numero;
		else return "" + numero;
	}
}
