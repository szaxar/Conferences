package baza;
import java.io.PrintWriter;
import java.util.Random;

public class Koszt {
int i;
PrintWriter zapis;
Random generator = new Random();
	public Koszt(int i,PrintWriter zapis){
		this.i=i;
		this.zapis=zapis;
	}
	
	double generuj(){
		int tygodni=generator.nextInt(6)+1;
		int znizka=generator.nextInt(20)+1;
		double cena=50*(10-tygodni)*(1-znizka);
		if(cena<0) cena=cena*-1;
		if(cena==0) cena=100;
	String x="INSERT INTO Koszt VALUES ("+cena+","+znizka+","+tygodni+");";
	zapis.println(x);
	return cena;
	}
}
