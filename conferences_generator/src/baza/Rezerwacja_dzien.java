package baza;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Random;

public class Rezerwacja_dzien {
	 PrintWriter zapis;
	int i;
	long data;
int rezerwacjanr;
	public Rezerwacja_dzien(int i, long data,PrintWriter zapis, int rezerwacjanr) {
		this.i = i;
		this.data = data;
		this.zapis=zapis;
		this.rezerwacjanr=rezerwacjanr;
	}
	
	Random generator = new Random();
	int tmp2=generator.nextInt(30);
	
	

	Date generuj() {
		if(tmp2>0) tmp2=tmp2*-1;
		tmp2=tmp2*24*3600;
		int ileOsob = generator.nextInt(150)+50;

		int uczestnicy=generator.nextInt(5)+1;

		int tmp = generator.nextInt(10);
		boolean anulowane;
		if (tmp < 8)
			anulowane = false;
		else
			anulowane = true;

		if (anulowane == false) {
			String x="INSERT INTO Rezerwacja_Dnia_Konf VALUES(" 
					+ rezerwacjanr + "," +uczestnicy  + "," + i + "," + ileOsob
					+ "," + "'" + new Date((data - tmp2) * 1000) + "'," + 0
					+ "," + null + ");";
			zapis.println(x);
		} else {
			
		String y="INSERT INTO Rezerwacja_Dnia_Konf VALUES("  
					+ rezerwacjanr + "," + uczestnicy + "," + i + "," + ileOsob
					+ "," + "'" + new Date((data - tmp2) * 1000) + "'," + 1
					+ ",'" + new Date((data - tmp2) * 1000) + "');";
		zapis.println(y);
		}
		
		
		return new Date((data - tmp2) * 1000);
	}
	
	
	int generujnr(){
		rezerwacjanr++;
		return rezerwacjanr;
	}
		
	

}
