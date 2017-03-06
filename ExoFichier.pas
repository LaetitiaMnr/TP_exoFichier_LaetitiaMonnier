program FExo; //Laetitia Monnier

uses crt;

CONST
	EFFECTIF = 2;

TYPE 
	client = record
		nom : string;
		prenom : string;
		adresse : string;
		cp : string;
		ville : string;
end;

PROCEDURE renseignement(var XClient : client; var f : TextFile);
begin 
	writeln('Entrez votre nom.');
	readln(XClient.nom);
	XClient.nom := upCase(XClient.nom);
	writeln(f,XClient.nom);
	writeln('Entrez votre prenom.');
	readln(XClient.prenom);
	XClient.prenom := upCase(XClient.prenom);
	writeln(f,XClient.prenom);
	writeln('Entrez votre adresse.');
	readln(XClient.adresse);
	writeln(f,XClient.adresse);
	writeln('Entrez votre code postal.');
	readln(XClient.cp);
	XClient.cp := copy(XClient.cp,1,5);
	writeln(f,XClient.cp);
	writeln('Entrez le nom de votre ville.');
	readln(XClient.ville);
	XClient.ville := upCase(XClient.ville);
	writeln(f,XClient.ville);
	writeln(f,' ');
end;

PROCEDURE modifier(var XClient : client; var f : TextFile);
begin
	{$I-}
	append(f);
	{$I+}
	IF IOResult <> 0 THEN
		rewrite(f);
	renseignement(XClient, f);
	close(f);
end;

PROCEDURE menu();
begin 
	writeln('-- Fiche de Renseignement Client --');
    writeln('1 : Inscription.');
    writeln('2 : Afficher la liste renseignement client.');
    writeln('0 : Sortir !');
end;

PROCEDURE affichage(var f : TextFile);
VAR
	s : string;
begin
	{$I-}
	Reset(f);
	{$I+}
	If IOResult <> 0 Then
		writeln('Une erreur s''est produite avec le fichier.')
	else
	begin
		while not Eof(f) do
		begin
			ReadLn(f,s);
			WriteLn(s);
		end;
		close(f);
	end; 
end;

PROCEDURE effaceEcran();
VAR
	compteur : integer;
begin
	GOTOXY(1, 5);
	FOR compteur := 1 TO 12 DO
		writeln('                             ');
	GOTOXY(1, 5);
end;

// Programme Principal

VAR
	XClient : client;
	f : TextFile;
	choix : integer;

BEGIN
	clrscr;
	Assign(f, 'FicheClient.txt');
	menu();
    REPEAT
	    readln(choix);
	    IF choix = 1 THEN
	    	modifier(XClient, f);
		effaceEcran();
	UNTIL (choix = 2) OR (choix = 0);
	IF choix = 2 THEN
	begin
		writeln;
		affichage(f);
	end
	ELSE IF choix = 0 THEN
		writeln('Exit');
	readln;
END.



// CONST
// 	EFFECTIF = 2

// TYPE 
// 	client = ENREGISTREMENT
// 		nom : CHAINE
// 		prenom : CHAINE
// 		adresse : CHAINE
// 		cp : CHAINE
// 		ville : CHAINE
// FINENREGISTREMENT

// PROCEDURE renseignement(var XClient : client; var f : TextFile)
// debut 
// 	ECRIRE('Entrez votre nom.')
// 	LIRE(XClient.nom)
// 	XClient.nom := upCase(XClient.nom)
// 	ECRIRE(f,XClient.nom)
// 	ECRIRE('Entrez votre prenom.')
// 	LIRE(XClient.prenom)
// 	XClient.prenom := upCase(XClient.prenom)
// 	ECRIRE(f,XClient.prenom)
// 	ECRIRE('Entrez votre adresse.')
// 	LIRE(XClient.adresse)
// 	ECRIRE(f,XClient.adresse)
// 	ECRIRE('Entrez votre code postal.')
// 	LIRE(XClient.cp)
// 	XClient.cp := copy(XClient.cp,1,5)
// 	ECRIRE(f,XClient.cp)
// 	ECRIRE('Entrez le nom de votre ville.')
// 	LIRE(XClient.ville)
// 	XClient.ville := upCase(XClient.ville)
// 	ECRIRE(f,XClient.ville)
// 	ECRIRE(f,' ')
// FINPROCEDURE

// PROCEDURE modifier(var XClient : client; var f : TextFile)
// debut
// 	{$I-}
// 	AJOUTER(f)
// 	{$I+}
// 	SI IOResult <> 0 ALORS
// 		REECRIRE(f)
// 	FINSI
// 	renseignement(XClient, f)
// 	FERMER(f)
// FINPROCEDURE

// PROCEDURE menu()
// debut 
// 	ECRIRE('-- Fiche de Renseignement Client --')
//  ECRIRE('1 : Inscription.')
//  ECRIRE('2 : Afficher la liste renseignement client.')
//  ECRIRE('0 : Sortir !')
// FINPROCEDURE

// PROCEDURE affichage(var f : TextFile)
// VAR
// 	s : CHAINE
// debut
// 	{$I-}
// 	Reset(f)
// 	{$I+}
// 	SI IOResult <> 0 ALORS
// 		writeln('Une erreur s''est produite avec le fichier.')
// 	SINON
// 		TANTQUE NON Eof(f) FAIRE
// 			LIRE(f,s)
// 			ECRIRE(s)
// 		FINTANTQUE
// 		FERMER(f)
// 	FINSI 
// FINPROCEDURE

// PROCEDURE effaceEcran()
// VAR
// 	compteur : ENTIER
// debut
// 	GOTOXY(1, 5)
// 	POUR compteur DE 1 A 12 FAIRE
// 		ECRIRE('                             ')
// 	GOTOXY(1, 5)
// FINPROCEDURE

// Programme Principal

// VAR
// 	XClient : client
// 	f : TextFile
// 	choix : ENTIER

// DEBUT
// 	Ajoutez un clrscr ici.
// 	ASSIGNER(f, 'FicheClient.txt')
// 	menu()
//     REPETER
// 	    LIRE(choix)
// 	    SI choix = 1 ALORS
// 	    	modifier(XClient, f)
// 		FINSI
// 		effaceEcran()
// 	JUSQUA (choix = 2) OR (choix = 0)
// 	SI choix = 2 ALORS
// 		affichage(f)
// 	SINON SI choix = 0 ALORS
// 		ECRIRE('Exit')
// 	FINSI
// FIN