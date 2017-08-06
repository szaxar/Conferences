package baza;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Random;

public class Rezerwacja_warsztatu {
int Warsztatyid;
PrintWriter zapis;
Date data;
int j;
	public Rezerwacja_warsztatu(int Warsztatyid,Date data,int j,PrintWriter zapis){
	this.Warsztatyid=Warsztatyid;
	this.data=data;
	this.j=j;
	this.zapis=zapis;
	}
	
	int generuj(){
		Random generator = new Random();
		int ilosc=30-generator.nextInt(10);
	String x="INSERT INTO Rezerwacja_Warsztatu VALUES("+j+","+
			Warsztatyid+","+ilosc+",'"+data+"',"+0+","+null+");";
	zapis.println(x);
	return ilosc;
	}
	
}
