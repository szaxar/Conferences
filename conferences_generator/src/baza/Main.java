package baza;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Main {

	public static void main(String[] args) throws FileNotFoundException {

		PrintWriter zapis = new PrintWriter("generator.txt");

		Random generator = new Random();
		int UczestnikDnia = 1;
		int ileOsob = 0;
		int Warsztatyid = 1;
		int iloscWarsztatow;
		int dzienKonf = 1;
		double kwota;
		long data = 1388530800;
		int ileDni;
		int dni;
		Date datarezerwaci;
		int rezerwacjanr = 1;
		int UczestnikWarsztatu = 1;
		Uzytkownik uzytkownik = new Uzytkownik(zapis);
		uzytkownik.generuj();

		for (int i = 1; i < 73; i++) {

			Konferencje konf = new Konferencje(i, new Date(data * 1000), zapis);
			ileDni = konf.generuj();

			

			for (int j = 1; j < ileDni + 1; j++) {
				
				
				
				List<Integer> lista = new ArrayList<>();
				iloscWarsztatow = generator.nextInt(3) + 2;

				Koszt koszt = new Koszt(dzienKonf, zapis);
				kwota = koszt.generuj();
				
				Dzieñ dzien = new Dzieñ(i, 200, j, zapis, dzienKonf,j);
				dzienKonf = dzien.generuj();

				Oplacone oplacone = new Oplacone(rezerwacjanr, kwota, new Date(
						data * 1000), zapis);
				oplacone.generuj();

				Rezerwacja_dzien rezerwacja_dzien = new Rezerwacja_dzien(dzienKonf-1,
						data, zapis, rezerwacjanr);

				datarezerwaci = rezerwacja_dzien.generuj();
				rezerwacjanr = rezerwacja_dzien.generujnr();

				Zarejestrowani_uzytkownicy zarejestrowani = new Zarejestrowani_uzytkownicy(
						(rezerwacjanr-1), datarezerwaci, UczestnikDnia, zapis);
				lista = zarejestrowani.generuj();

				UczestnikDnia = UczestnikDnia + lista.size();

				for (int k = 1; k < iloscWarsztatow + 1; k++) {

					Warsztaty warsztaty = new Warsztaty(dzienKonf-1, Warsztatyid,
							zapis);
					Warsztatyid = warsztaty.generuj();

					Rezerwacja_warsztatu rezerwacja_warsztatu = new Rezerwacja_warsztatu(
							Warsztatyid-1, datarezerwaci, (rezerwacjanr-1), zapis);
					ileOsob = rezerwacja_warsztatu.generuj();

					for (int l = 1; l < ileOsob; l++) {
						Zarejestrowani_warsztat zare = new Zarejestrowani_warsztat(
								Warsztatyid-1, lista, datarezerwaci,
								UczestnikWarsztatu, zapis);
						UczestnikWarsztatu = zare.generator();

					}

				}

			}
			dni = generator.nextInt(5) + 12;
			data = data + dni * 24 * 3600;
		}
		zapis.close();
	}

}