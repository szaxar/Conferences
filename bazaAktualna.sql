/*
 IF EXISTS(select*  from sys.Databases where name = 'TEST')
DROP DATABASE TEST

CREATE DATABASE TEST
*/
--
/*
USE TEST 

IF OBJECT_ID('TEST.Dzie�_Konferencji', 'U') IS NOT NULL DROP TABLE TEST.Dzie�_Konferencji
CREATE TABLE Dzie�_Konferencji (
  Dzien_konf_id INTEGER   NOT NULL Primary key IDENTITY(1,1),
  Konferencja_id INTEGER  NOT NULL,
  Koszt_id INTEGER NOT NULL, 
  dzien_konf_v INTEGER NOT NULL check(dzien_konf_v > 0 and dzien_konf_v < 10),
  ilo��_miejsc INTEGER NOT NULL check(ilo��_miejsc>0),
  
);

IF OBJECT_ID('TEST.Klient', 'U') IS NOT NULL DROP TABLE TEST.Klient
CREATE TABLE Klient (
  Klient_id INTEGER NOT NULL Primary key IDENTITY(1,1),
  nazwa VARCHAR(45) unique  NOT NULL,
  telefon INTEGER NULL Check(telefon>100000000 and telefon<999999999),
  email VARCHAR(45) NOT NULL Unique CHECK (email LIKE '%_@_%._%'),
  login VARCHAR(20) NOT NULL Unique ,
  haslo VARCHAR(45) NOT NULL ,
  Firma BIT not null default 0,
  
);

IF OBJECT_ID('TEST.Konferencja', 'U') IS NOT NULL DROP TABLE TEST.Konferencja

CREATE TABLE Konferencja (
  Konferencja_id INTEGER  NOT NULL Primary key IDENTITY(1,1),
  Nazwa VARCHAR(45) Not NULL,
  Data_rozpocz�cia DATE NOT NULL,
  Ilo��_dni INTEGER  NOT NULL check(ilo��_dni>0),
 
);

IF OBJECT_ID('TEST.Koszt', 'U') IS NOT NULL DROP TABLE TEST.Koszt
CREATE TABLE Koszt (
  Koszt_id INTEGER   NOT NULL Primary key IDENTITY(1,1),
  Cena DECIMAL NOT NULL CHECK (Cena >= 0),
  Zni�ka_studencka FLOAT NOT NULL CHECK(Zni�ka_studencka >= 0 and Zni�ka_studencka <= 100),
  Do_rozpocz�cia_tygodni INTEGER  NULL,
  
);

IF OBJECT_ID('TEST.Op�acone', 'U') IS NOT NULL DROP TABLE TEST.Op�acone
CREATE TABLE Op�acone (
  id_Op�acone INTEGER  NOT NULL Primary key IDENTITY(1,1),
  Kwota DECIMAL NOT NULL CHECK (Kwota > 0),
  Data_wp�aty DATE NOT NULL,
);

IF OBJECT_ID('TEST.Rezerwacja_Dnia_Konf', 'U') IS NOT NULL DROP TABLE TEST.Rezerwacja_Dnia_Konf
CREATE TABLE Rezerwacja_Dnia_Konf (
  Rezerwacja_id INTEGER   NOT NULL Primary key IDENTITY(1,1),
  Op�acone_id_Op�acone Integer null,
  Klient_id INTEGER  NOT NULL ,--
  Dzie�_Konferencji_Dzien_konf_id INTEGER  NOT NULL, --
  Ilo��_os�b INTEGER NOT NULL check(ilo��_os�b>0),
  Data_rezerwacji DATE NOT NULL,
  Anulowano BIT NOT NULL default 0,
  Data_anulowania DATE  NULL,
  
);

IF OBJECT_ID('TEST.Rezerwacja_Warsztatu', 'U') IS NOT NULL DROP TABLE TEST.Rezerwacja_Warsztatu
CREATE TABLE Rezerwacja_Warsztatu (
  id_Rezerwacja_Warsztatu INTEGER NOT NULL Primary key IDENTITY(1,1),
  Rezerwacja_Dnia_Konf_Rezerwacja_id INTEGER NOT NULL,
  Warsztaty_Warsztat_id INTEGER  NOT NULL, --
  Ilo��_os�b INTEGER NOT NULL check(Ilo��_os�b>0),
  Data_rezerwacji DATE NOT NULL,
  Anulowano BIT NOT NULL default 0,
  Data_anulowania DATE NULL,
 
);



IF OBJECT_ID('TEST.Uczestnik', 'U') IS NOT NULL DROP TABLE TEST.Uczestnik
CREATE TABLE Uczestnik (
  Uczestnik_id INTEGER NOT NULL Primary key IDENTITY(1,1),
  Imie VARCHAR(45) NOT NULL,
  Nazwisko VARCHAR(45) NOT NULL,
  Kod_pocztowy INTEGER  NULL Check(Kod_pocztowy>10000 and Kod_pocztowy<99999),
  Miasto VARCHAR(45)  NULL,
  Ulica VARCHAR(45)  NULL,
  Student BIT NOT NULL default 0,
  Nr_legitymacji INTEGER NULL Check(Nr_legitymacji>0 )
  
);

IF OBJECT_ID('TEST.Warsztaty', 'U') IS NOT NULL DROP TABLE TEST.Warsztaty
CREATE TABLE Warsztaty (
  Warsztat_id INTEGER NOT NULL Primary key IDENTITY(1,1),
  Dzie�_Konferencji_Dzien_konf_id Integer  NOT NULL, --
  Temat VARCHAR(45) NOT NULL,
  Godzina_rozpocz�cia TIME NOT NULL,
  Godzina_zako�czenia TIME NOT NULL,
  Ilo��_miejsc INTEGER  NULL check(Ilo��_miejsc>0),
  Cena DECIMAL NULL check (Cena>0),
 
);

IF OBJECT_ID('TEST.Zarejestrowani_na_warsztat', 'U') IS NOT NULL DROP TABLE TEST.Zarejestrowani_na_warsztat
CREATE TABLE Zarejestrowani_na_warsztat (
  Uczestnik_Warsztatu INTEGER NOT NULL Primary key IDENTITY(1,1),
  Rezerwacja_Warsztatu_id_Rezerwacja_Warsztatu INTEGER  NOT NULL, --
  Zarejestrowani_uczestnicy_Uczestnik_Dnia INTEGER  NOT NULL , --
  Data_zg�oszenia DATE NULL,
  
);
IF OBJECT_ID('TEST.Zarejestrowani_uczestnicy', 'U') IS NOT NULL DROP TABLE TEST.Zarejestrowani_uczestnicy
CREATE TABLE Zarejestrowani_uczestnicy (
  Uczestnik_Dnia INTEGER NOT NULL Primary key IDENTITY(1,1),
  Rezerwacja_Dnia_Konf_Rezerwacja_id INTEGER  NOT NULL, --
  Uczestnik_id INTEGER  NOT NULL ,--
  Data_zg�oszenia DATE NULL,
  
);

ALTER TABLE Dzie�_Konferencji 
   ADD FOREIGN KEY (Konferencja_id) REFERENCES Konferencja (Konferencja_id);

ALTER TABLE Dzie�_Konferencji 
   ADD FOREIGN KEY (Koszt_id) REFERENCES Koszt (Koszt_id);
   

   ALTER TABLE Rezerwacja_Dnia_Konf 
   ADD FOREIGN KEY (Op�acone_id_Op�acone) REFERENCES Op�acone (id_Op�acone);



    ALTER TABLE Rezerwacja_Dnia_Konf 
   ADD FOREIGN KEY (Klient_id) REFERENCES Klient (Klient_id);

     ALTER TABLE Rezerwacja_Dnia_Konf 
   ADD FOREIGN KEY (Dzie�_Konferencji_Dzien_konf_id) REFERENCES Dzie�_Konferencji (Dzien_konf_id);


   ALTER TABLE Rezerwacja_Warsztatu 
   ADD FOREIGN KEY (Warsztaty_Warsztat_id) REFERENCES Warsztaty (Warsztat_id);


    ALTER TABLE Warsztaty 
   ADD FOREIGN KEY (Dzie�_Konferencji_Dzien_konf_id) REFERENCES Dzie�_Konferencji (Dzien_konf_id);


   ALTER TABLE Zarejestrowani_na_warsztat 
   ADD FOREIGN KEY (Rezerwacja_Warsztatu_id_Rezerwacja_Warsztatu) REFERENCES Rezerwacja_Warsztatu (id_Rezerwacja_Warsztatu);
   

   ALTER TABLE Zarejestrowani_na_warsztat 
   ADD FOREIGN KEY (Zarejestrowani_uczestnicy_Uczestnik_Dnia) REFERENCES Zarejestrowani_uczestnicy (Uczestnik_Dnia);

      ALTER TABLE Zarejestrowani_uczestnicy 
   ADD FOREIGN KEY (Rezerwacja_Dnia_Konf_Rezerwacja_id) REFERENCES Rezerwacja_Dnia_Konf (Rezerwacja_id);
   
     ALTER TABLE Zarejestrowani_uczestnicy 
   ADD FOREIGN KEY (Uczestnik_id) REFERENCES Uczestnik (Uczestnik_id);

   ALTER TABLE Rezerwacja_Warsztatu
   ADD FOREIGN KEY (Rezerwacja_Dnia_Konf_Rezerwacja_id ) REFERENCES Rezerwacja_Dnia_Konf (Rezerwacja_id)
 
  GO
 */
--
   --DodajKlienta � procedura dodaj�ca Klienta
   

   /*
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DoajKlienta]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].DodajKlienta 
GO
CREATE PROCEDURE [dbo].[DodajKlienta]
	@nazwa VARCHAR(45),
	@telefon VARCHAR(45),
	@email VARCHAR(45),
	@login VARCHAR(45),
	@haslo VARCHAR(45),
	@Firma BIT
AS
BEGIN
	INSERT INTO [Klient](nazwa, telefon, email, login, haslo, Firma) 
	VALUES (@nazwa, @telefon, @email, @login, @haslo, @Firma)
END 
GO


--DodajKonferencje � procedura dodaj�ca Konferencje
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DodajKonferencje]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].DodajKonferencje 
GO
	CREATE PROCEDURE [dbo].[DodajKonferencje]
		@nazwa VARCHAR(45),
		@dataRoz DATE,
		@iloscDni INTEGER
	AS
	BEGIN
		INSERT INTO [Konferencja](nazwa, Data_rozpocz�cia, Ilo��_dni)
		VALUES (@nazwa, @dataRoz, @iloscDni)
	END 
GO

--DodajDzienKonferencji � procedura dodajaca dzien konferencji

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DodajDzienKonf]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].DodajDzienKonf 
GO
CREATE PROCEDURE [dbo].[DodajDzienKonf]
	@KonferencjaId INTEGER,
	@dzienKonf INTEGER,
	@iloscMiejsc INTEGER
AS	
BEGIN
	INSERT INTO [Dzie�_Konferencji](Konferencja_Id, dzien_konf_v, ilo��_miejsc)
	VALUES (@KonferencjaId, @dzienKonf, @iloscMiejsc)
END 
GO

--DodajUczestnika � procedura dodajaca uczestnika

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DodajUczestnika]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].DodajUczestnika  
GO
CREATE PROCEDURE [dbo].[DodajUczestnika]
	@Imie VARCHAR(45),
	@Nazwisko VARCHAR(45),
	@Kod_pocztowy INTEGER,
	@Miasto VARCHAR(45),	
	@Ulica VARCHAR(45),
	@Student BIT,
	@Nr_leg INTEGER
AS
BEGIN
	INSERT INTO [Uczestnik](Imie, Nazwisko, Kod_pocztowy, Miasto, Ulica, Student, Nr_legitymacji)
	VALUES (@Imie, @Nazwisko, @Kod_pocztowy, @Miasto, @Ulica, @Student, @Nr_leg)
END 
GO

   


-- procedura dodaje informacje o uiszczonej op�acie

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[[dodajOplate]]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dodajOplate]  
GO
CREATE PROCEDURE [dbo].[dodajOplate]
	@Kwota DECIMAL
AS
BEGIN
	INSERT INTO [Op�acone](Kwota, Data_wp�aty)
	VALUES(@Kwota, getDate())
END
GO

-- procedura dodaje informacje o kosztach i progach cenowych w zale�no�ci od czasu rejestracji. 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dodajKoszt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dodajKoszt]  
GO
CREATE PROCEDURE [dbo].[dodajKoszt]
	@Cena DECIMAL(5,1),
	@Zni�ka_studencka FLOAT,
	@do_rozpoczecia INTEGER
AS
BEGIN
	INSERT INTO [Koszt](Cena, Zni�ka_studencka, Do_rozpocz�cia_tygodni)
	VALUES(@Cena, @Zni�ka_studencka, @do_rozpoczecia)
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dodajWarsztat]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[dodajWarsztat] 
GO
CREATE PROCEDURE [dbo].[dodajWarsztat]
	@Warsztat_id INTEGER,
    @Dzien_konf_id INTEGER,
    @Temat VARCHAR(45),
    @Godzina_rozpocz�cia TIME,
    @Godzina_zako�czenia TIME,
    @Ilo��_miejsc INTEGER,
    @Cena DECIMAL
AS
BEGIN
	INSERT INTO [Warsztaty](Warsztat_id, Dzie�_Konferencji_Dzien_konf_id, Temat, Godzina_rozpocz�cia, Godzina_zako�czenia,
				Ilo��_miejsc, Cena)
	VALUES (@Warsztat_id, @Dzien_konf_id, @Temat, @Godzina_rozpocz�cia, @Godzina_zako�czenia, @Ilo��_miejsc, @Cena)
END
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zarejestrujUczestnikaNaDzien]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[zarejestrujUczestnikaNaDzien] 
GO
CREATE PROCEDURE [dbo].[zarejestrujUczestnikaNaDzien]
	@Uczestnik_id INTEGER,
	@Rezerwacja_id INTEGER
AS
BEGIN
	
	INSERT INTO [Zarejestrowani_uczestnicy](Rezerwacja_Dnia_Konf_Rezerwacja_id, Uczestnik_id, Data_zg�oszenia)
	VALUES (@Rezerwacja_id, @Uczestnik_id, getDate())
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[zarejestrujUczestnikaNaWarsztat]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[zarejestrujUczestnikaNaWarsztat] 
GO
CREATE PROCEDURE [dbo].[zarejestrujUczestnikaNaWarsztat]
	@Uczestnik_id INTEGER,
	@idRezerwacjaWarsztatu INTEGER
AS
BEGIN	
	DECLARE @UczestnikDnia INT = (SELECT Uczestnik_Dnia FROM Zarejestrowani_uczestnicy WHERE (@Uczestnik_id = Uczestnik_id))

	IF (@UczestnikDnia = NULL)
	BEGIN
	  RAISERROR('Ten uczestnik nie jest jeszcze zarejestrowany na konferencje. Nie mo�na zarejestrowa� go na wybrany warsztat.', 16, -1);
	END
	
	INSERT INTO [Zarejestrowani_na_warsztat](Rezerwacja_Warsztatu_id_Rezerwacja_Warsztatu, Zarejestrowani_uczestnicy_Uczestnik_Dnia, Data_zg�oszenia)
	VALUES (@idRezerwacjaWarsztatu, @UczestnikDnia, getDate())
END
GO

CREATE PROCEDURE [dbo].[zarezerwujMiejscaNaDzien]
	@IloscOs INTEGER,
	@idKlienta INTEGER,
	@idDnia	INTEGER
AS
BEGIN
	

	INSERT INTO [Rezerwacja_Dnia_Konf](Klient_id, Dzie�_Konferencji_Dzien_konf_id, Ilo��_os�b, Data_rezerwacji)
	VALUES (@idKlienta, @idDnia, @IloscOs, getDate())
END
GO

CREATE PROCEDURE [dbo].[zarezerwujMiejscaNaWarsztat]
	@IloscOs INTEGER,
	@idWar INTEGER,
	@rezDniaid INTEGER
AS
BEGIN
	INSERT INTO [Rezerwacja_Warsztatu](Warsztaty_Warsztat_id, Ilo��_os�b, Rezerwacja_Dnia_Konf_Rezerwacja_id)
	VALUES(@IloscOs, @idWar, @rezDniaid)
END
GO


CREATE PROCEDURE [dbo].[anulowanieRezerwacjiWarsztatu]
	@Rezerwacja_id INTEGER
AS
BEGIN

	
	if( (SELECT Anulowano FROM Rezerwacja_Warsztatu WHERE @Rezerwacja_id = id_Rezerwacja_Warsztatu) = 0)
	BEGIN
		UPDATE Rezerwacja_Warsztatu
		SET Anulowano = 1, 
			Data_anulowania = GETDATE() 
			WHERE id_Rezerwacja_Warsztatu = @Rezerwacja_id
	END
	ELSE RAISERROR('Warsztat by� ju� anulowany.', 16, -1);
END
GO

CREATE PROCEDURE [dbo].[anulowanieRezerwacjiDnia]
	@Rezerwacja_id INTEGER
AS
BEGIN
	if( (SELECT Anulowano FROM Rezerwacja_Dnia_Konf WHERE @Rezerwacja_id = Rezerwacja_id) = 0)
	BEGIN
		UPDATE Rezerwacja_Dnia_Konf
		SET Anulowano = 1, 
			Data_anulowania = GETDATE()
			WHERE Rezerwacja_id = @Rezerwacja_id
	END
	ELSE RAISERROR('Rezerwacja by�a ju� anulowana.', 16, -1);
END
GO

CREATE PROCEDURE [dbo].[anulujNieoplaconeRezerwacje]	
AS
BEGIN
	DECLARE tab	CURSOR LOCAL FOR (SELECT rdk.Data_rezerwacji, rdk.Rezerwacja_id  FROM Rezerwacja_Dnia_Konf as rdk
								LEFT JOIN Op�acone as o ON rdk.Op�acone_id_Op�acone = o.id_Op�acone
								WHERE rdk.Op�acone_id_Op�acone is NULL)



	DECLARE @Rezerwacja_id INTEGER, @dataRezerwacji date
	OPEN tab
	FETCH NEXT FROM tab INTO  @dataRezerwacji, @Rezerwacja_id
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF(DATEDIFF(day,@dataRezerwacji,GETDATE()) > 7) 
			BEGIN 
				exec anulowanieRezerwacjiDnia @Rezerwacja_id
			END
			FETCH NEXT FROM tab INTO @Rezerwacja_id, @dataRezerwacji
		END
	CLOSE tab
	DEALLOCATE tab
END


-- trigger, kt�ry sprawdza czy data rezerwacji nie jest na mniej ni� 2 tygodnie przed rozpoczeciem

IF OBJECTPROPERTY(OBJECT_ID('{[ZabronRejestracjiNaDwaTygPrzed]}'), 'IsTrigger') = 1
DROP TRIGGER [ZabronRejestracjiNaDwaTygPrzed]
GO
CREATE TRIGGER [dbo].[ZabronRejestracjiNaDwaTygPrzed]
  ON [dbo].[Rezerwacja_Dnia_Konf]
  AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @Rezerwacja_id INTEGER = (SELECT Rezerwacja_id FROM Inserted)
	DECLARE @DataRez DATE = (SELECT Data_rezerwacji FROM Inserted)
	DECLARE @DataRozp DATE = (SELECT Data_rozpocz�cia FROM Konferencja as k
								JOIN Dzie�_Konferencji as dk ON k.Konferencja_id = dk.Konferencja_id
								JOIN Rezerwacja_Dnia_Konf as rdk ON rdk.Dzie�_Konferencji_Dzien_konf_id = dk.Dzien_konf_id
								WHERE rdk.Rezerwacja_id = @Rezerwacja_id)

	IF((DAY(@DataRozp) - DAY(@DataRez)) < 14)
	BEGIN
		RAISERROR ('Za po�no aby zarezerwowa�.', 16, -1);
		ROLLBACK TRANSACTION
	END

END
GO


-- czy liczba miejsc na warsztaty tego dnia nie jest wieksza niz na konferencje odbywaj�c� si� tego dnia
CREATE TRIGGER [dbo].[placesOfWorkshopLessThanConfDay]
	ON [dbo].[Warsztaty] 
	AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @miejscaWar INTEGER = (SELECT Ilo��_miejsc FROM INSERTED);
	DECLARE @DzienKonfId INTEGER = (SELECT Dzie�_Konferencji_Dzien_konf_id FROM inserted)
	DECLARE @miejscaKonf INTEGER = (SELECT Ilo��_miejsc FROM Dzie�_Konferencji WHERE
								(@DzienKonfId = Dzie�_Konferencji.Dzien_konf_id))
	IF( @miejscaWar > @miejscaKonf )
	BEGIN
		RAISERROR ('W warsztacie nie mo�e uczestniczy� wi�cej os�b ni� w konferencji.', 16, -1);
		ROLLBACK TRANSACTION
	END
END
GO


--TRIGGER SPRAWDZAJACY CZY CZY LICZBA OSOB NA WARSZTAT NIE PRZEKRACZA LICZBY OSOB NA DZIEN KONFERENCJI
CREATE TRIGGER [dbo].[nieMo�naRezerwowa�naWarsztaty]
	ON [dbo].[Rezerwacja_Warsztatu]
	AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @RezerwacjaKonfId INTEGER = (SELECT Rezerwacja_Dnia_Konf_Rezerwacja_id FROM INSERTED)
	DECLARE @liczbaOsDzien INTEGER = (SELECT rdk.Ilo��_os�b FROM Rezerwacja_Dnia_Konf as rdk WHERE (@RezerwacjaKonfId = rdk.Rezerwacja_id))
	DECLARE @liczbaOsWar INTEGER = (SELECT Ilo��_os�b FROM INSERTED)


	if(@liczbaOsWar > @liczbaOsDzien)
	BEGIN
		RAISERROR ('Nie mo�na zarezerwoa� wi�cej miejsc na warsztat ni� na dany dzie� konferencji', 16, -1);
		ROLLBACK TRANSACTION
	END
END
GO



-- uczestnik nie powinien rejestrowac sie na 2 warsztaty trwajace w tym samym czasie.

--drop trigger [nieMoznaRejestrowacNaWarsztatyRownoczesne]
CREATE TRIGGER [dbo].[nieMoznaRejestrowacNaWarsztatyRownoczesne]
	ON [dbo].[Zarejestrowani_na_warsztat]
	AFTER INSERT, UPDATE
AS 
BEGIN
	DECLARE @isNull INTEGER = (SELECT Zarejestrowani_uczestnicy_Uczestnik_Dnia FROM INSERTED
									JOIN Rezerwacja_Warsztatu as rw1 ON rw1.id_Rezerwacja_Warsztatu = INSERTED.Rezerwacja_Warsztatu_id_Rezerwacja_Warsztatu
									JOIN Warsztaty as war ON rw1.Warsztaty_Warsztat_id = war.Warsztat_id
										WHERE Zarejestrowani_uczestnicy_Uczestnik_Dnia IN (SELECT Zarejestrowani_uczestnicy_Uczestnik_Dnia
										FROM Zarejestrowani_na_warsztat AS znw
										JOIN Rezerwacja_Warsztatu as rw2 ON znw.Rezerwacja_Warsztatu_id_Rezerwacja_Warsztatu = rw2.id_Rezerwacja_Warsztatu
										JOIN Warsztaty as war2 ON rw2.Warsztaty_Warsztat_id = war2.Warsztat_id 
										  WHERE (Zarejestrowani_uczestnicy_Uczestnik_Dnia = znw.Zarejestrowani_uczestnicy_Uczestnik_Dnia 
										and rw2.Warsztaty_Warsztat_id <> rw1.Warsztaty_Warsztat_id 
										and (
										(war.Godzina_rozpocz�cia < war2.Godzina_zako�czenia and war.Godzina_zako�czenia > war2.Godzina_rozpocz�cia) OR
										(war.Godzina_rozpocz�cia < war2.Godzina_rozpocz�cia and war.Godzina_zako�czenia > war2.Godzina_zako�czenia) OR
										(war.Godzina_rozpocz�cia < war2.Godzina_rozpocz�cia and war.Godzina_zako�czenia < war2.Godzina_zako�czenia) OR
										(war.Godzina_rozpocz�cia > war2.Godzina_rozpocz�cia and war.Godzina_zako�czenia < war2.Godzina_zako�czenia)
										)
										)))

	IF(@isNull is not NULL or @isNull != 0)
	BEGIN
		RAISERROR ('Nie mo�na zarejestrowac tego uczestnika, gdy� on ju� jest zarejestrowany na warsztat odbywaj�cy si� w tym samym czasie', 16, -1);
		ROLLBACK TRANSACTION
	END
END
GO


--trigger sprawdzaj�cy czy godzina rozpocz�cia warsztatu jest przed godzin� zako�czenia oraz
-- czy warsztat trwa przynajmniej 30 minut
CREATE TRIGGER [dbo].[godzinaRozpMniejszaOdGodzinyZak]
	ON [dbo].[Warsztaty]
	AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @rozp TIME = (SELECT Godzina_rozpocz�cia FROM INSERTED)
	DECLARE @zak TIME = (SELECT Godzina_zako�czenia FROM INSERTED)

	IF(DATEDIFF(MINUTE, @ROZP, @ZAK) < 30)
	BEGIN
		RAISERROR ('Godzina rozpocz�cia musi byc mniejsza od godziny zako�czenia oraz warsztat powinien
					trwa� przynajmniej 30 minut.', 16, -1);
		ROLLBACK TRANSACTION
	END
END


GO
Create view Najdrozszy_Warsztat as
Select Top 1 * from Warsztaty
order by Cena 

GO
Create view Najdrozsza_Konferencja as
Select Top 1 * from Koszt
order by Cena desc
GO

Create view Napopularniejszy_Dzien as
Select TOP 1 * from Rezerwacja_Warsztatu
order by Ilo��_os�b desc
GO

Create view Najblizsza_Konf as
select TOP 1 * from Konferencja
where Data_rozpocz�cia>GETDATE()
order by Data_rozpocz�cia  
GO

Create view Anulowane_Warsztaty as
Select * from Rezerwacja_Warsztatu
where Anulowano=1
GO

Create view Anulowane_Dni as
Select * from Rezerwacja_Dnia_Konf
where Anulowano=1
GO

Create view Najdluzsza_konf as
select top 1 * from Konferencja
order by Ilo��_dni desc
GO

Create view Uczestnik_nieStudent as
Select * from Uczestnik
where Student=0
GO

Create view Uczestnik_Student as
Select * from Uczestnik
where Student=1
GO

Create view Klient_Firma as
Select * from Klient
where Firma=1
GO

Create view Klient_nieFirma as
Select * from Klient
where Firma=0
GO

Create view Nie_Oplacone as
Select * from Rezerwacja_Dnia_Konf
where Op�acone_id_Op�acone is null
GO
*/