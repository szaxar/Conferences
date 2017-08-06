package baza;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Zarejestrowani_warsztat {

	List<Integer> lista = new ArrayList<>();
	int Warsztatyid;
	Date data;
	int UczestnikWarsztatu;
	 PrintWriter zapis;
	public Zarejestrowani_warsztat(int Warsztatyid, List<Integer> lista,
			Date data, int UczestnikWarsztatu,PrintWriter zapis) {
		this.Warsztatyid = Warsztatyid;
		this.lista = lista;
		this.data = data;
		this.UczestnikWarsztatu = UczestnikWarsztatu;
		this.zapis=zapis;
	}

	int generator(){
		Random generator = new Random();
		int uczestnik=generator.nextInt(lista.size());
		String x="INSERT INTO Zarejestrowani_na_warsztat VALUES("+
		Warsztatyid+","+lista.get(uczestnik)+",'"+data+"');";
		zapis.println(x);
				UczestnikWarsztatu++;
		return UczestnikWarsztatu;
	}
}
