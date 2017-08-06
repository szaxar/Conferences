package baza;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;



public class Zarejestrowani_uzytkownicy {

	int j;
	Date data;
	int uczestnik;
	int UczestnikDnia;
	int dni;
	 PrintWriter zapis;
	public Zarejestrowani_uzytkownicy(int j, Date data, int UczestnikDnia,PrintWriter zapis) {
		this.j = j;
		this.data = data;
		this.UczestnikDnia = UczestnikDnia;
		this.zapis=zapis;
	}

	List<Integer> generuj() {
		 List<Integer> lista = new ArrayList<>();
		Random generator = new Random();

		int ile = generator.nextInt(50) + 150;

		for (int i = 1; i < ile + 1; i++) {
			uczestnik = generator.nextInt(2999)+1;		
			dni = generator.nextInt(5) + 1;
			String x="INSERT INTO Zarejestrowani_uczestnicy VALUES("
							+j+ "," + uczestnik + ",'"
							+ new Date(data.getTime() - dni * 24 * 3600 * 1000)
							+ "');";
			zapis.println(x);
			lista.add(UczestnikDnia);
			UczestnikDnia++;
			
		}
		return lista;
	}
}
