package baza;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Random;

public class Uzytkownik {

	PrintWriter zapis;

	public Uzytkownik(PrintWriter zapis) {
		this.zapis = zapis;
	}

	void generuj() throws FileNotFoundException {

		Random generator = new Random();
		String[] imie = { "Adam", "Mateusz", "Tomasz", "Wiktor", "Dawid",
				"Krzysztof", "Miko³aj", "Kornel", "Szymon", "Jakub" };
		String[] nazwisko = { "Nowak", "Kowalski", "£êczyñski", "Machowski",
				"Cira", "Nowakowski" };

		String[] miasto = { "Kraków", "Warszawa", "Tarnów", "Wroc³aw",
				"Chrzanów", "Oœwiêcim", "Gdañsk" };
		String[] ulica = { "Glowna", "Dworcowa", "Poboczna", "Papieska",
				"Szybka" };
		int kod;
		int tmp;
		boolean student;
		int nrStudent = 0;
		for (int i = 1; i < 3000; i++) {
			kod = generator.nextInt(89999);
			kod = kod + 10000;
			student = generator.nextBoolean();
			if (student) {
				tmp = 1;
				nrStudent = generator.nextInt(1000000);
			} else
				tmp = 0;

			if (student) {
				String x = "INSERT INTO Uczestnik VALUES ("  + "'"
						+ imie[generator.nextInt(imie.length)] + "'" + ","
						+ "'" + nazwisko[generator.nextInt(nazwisko.length)]
						+ "'" + "," + kod + "," + "'"
						+ miasto[generator.nextInt(miasto.length)] + "'" + ","
						+ "'" + ulica[generator.nextInt(ulica.length)] + "'"
						+ "," + tmp + "," + nrStudent + ");";

				zapis.println(x);

			} else {
				String y = "INSERT INTO Uczestnik VALUES (" + "'"
						+ imie[generator.nextInt(imie.length)] + "'" + ","
						+ "'" + nazwisko[generator.nextInt(nazwisko.length)]
						+ "'" + "," + +kod + "," + "'"
						+ miasto[generator.nextInt(miasto.length)] + "'" + ","
						+ "'" + ulica[generator.nextInt(ulica.length)] + "'"
						+ "," + tmp + ",null" + ");";
				zapis.println(y);

			}

		}

	}

}
