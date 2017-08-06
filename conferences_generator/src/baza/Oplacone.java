package baza;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Random;

public class Oplacone {
	 PrintWriter zapis;
	Random generator = new Random();
	int i;
	Date rezerwacja;
	long tmp;
	double kwota;

	public Oplacone(int i, double kwota, Date rezerwacja,PrintWriter zapis) {
		this.i = i;
		this.rezerwacja = rezerwacja;
		this.kwota = kwota;
		this.zapis=zapis;
	}

	void generuj() {

		int tmp = generator.nextInt(20) + 7;
		rezerwacja = new Date(rezerwacja.getTime() - tmp *24* 3600 * 1000);

		String x="INSERT INTO Op³acone VALUES("  + kwota + ","
				+ "'" + rezerwacja + "');";
		zapis.println(x);
		

	}
}
