package baza;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Random;

public class Konferencje {
	PrintWriter zapis;
	int i;
	private Date data;
	int ile;
	Random generator = new Random();

	public Konferencje(int i, Date data, PrintWriter zapis) {
		this.i = i;
		this.data = data;
		this.zapis = zapis;
	}

	String nazwa[] = { "Informatyka", "Matematyka", "Grafika", "Systemy",
			"Bazy Danych" };

	int generuj() {
		ile = generator.nextInt(9) + 1;
		data = new Date(data.getTime() + generator.nextInt(30) * 24 * 3600
				* 1000);
		String x="INSERT INTO Konferencja VALUES (" + "'"
				+ nazwa[generator.nextInt(nazwa.length)] + "','" + data + "',"
				+ ile + ");";
		zapis.println(x);
		return ile;

	}

}
