package baza;


import java.io.PrintWriter;
import java.util.Random;

public class Dzieñ {
	 PrintWriter zapis;
	int i;
	Random generator = new Random();
	private int ilosc;
int dzien;
int dzienKonf;
int tmp;
	public Dzieñ(int i, int ilosc,int dzien,PrintWriter zapis,int dzienKonf,int tmp) {
		this.i = i;
		this.ilosc = ilosc;
		this.dzien=dzien;
		this.zapis=zapis;
		this.dzienKonf=dzienKonf;
		this.tmp=tmp;
	}

	

	int generuj() {
		
		String x="INSERT INTO Dzieñ_Konferencji VALUES (" + i
				+ "," + dzien + "," + tmp + "," + ilosc + ");";
zapis.println(x);
dzienKonf++;
return dzienKonf;
	      
	}
}
