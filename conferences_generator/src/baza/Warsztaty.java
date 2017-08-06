package baza;

import java.io.PrintWriter;
import java.util.Random;

public class Warsztaty {
	int j;
	int Warsztatyid;
	 PrintWriter zapis;
	public Warsztaty(int j, int Warsztatyid,PrintWriter zapis) {
		this.j = j;
		this.Warsztatyid = Warsztatyid;
		this.zapis=zapis;
	}

	String[] temat = { "Technologia", "Inzyneria", "Programowanie",
			"Kryptografia" };

	int generuj() {

		Random generator = new Random();
		int godzina = generator.nextInt(5) + 10;
		int godzina2 = godzina + 2;
		String x="INSERT INTO Warsztaty VALUES(" 
				+ j + ",'" + temat[generator.nextInt(temat.length)] + "','"
				+ godzina + ":00:00.0000000" + "','" + godzina2
				+ ":00:00.0000000'," + 30 + "," + 50 + ");";
		zapis.println(x);
		Warsztatyid++;
		return Warsztatyid;
	}
}
