unit menu;

{$mode objfpc}{$H+}

interface

procedure menuAvertissement();
procedure creationChoixAvertissement(vitesse : integer);
procedure creationMenuInterface(vitesse : integer);
procedure creationChoixMenuInterface(vitesse : integer);
procedure creationChoix();

implementation

uses
  Classes, SysUtils,personnage,personageIHM,GestionEcran,gestionTexte,crtPerso;



procedure creationChoixAvertissement(vitesse : integer);
begin
     creationMenuInterface(0);
     deplacerCurseurXY(60-23,10);
     texteAtemps('Vous etes sur le point de creer un personnage.',vitesse,Red);
     dessinerCadreXY(40,12,50,16,simple,White,Black);
     dessinerCadreXY(70,12,80,16,simple,White,Black);
end;

procedure menuAvertissement();
var cho : boolean;
    rep : integer = 1;
    ch : char;
begin
    creationChoixAvertissement(80);
    texteXY(44,14,'Oui',Red);
    texteXY(74,14,'Non',White);
    deplacerCurseurXY(47,14);
    cho := True;
    while (cho = True) do
          begin
              ch := ReadKey;
              case ch of
                   #75 : if (rep < 2) then
                            rep := rep + 1
                         else
                            rep := 1;
                   #77 : if (rep > 1) then
                            rep := rep - 1
                         else
                            rep := 2;
                   #13 : cho := False;
              end;



              if (rep = 1) then
                 begin
                     creationChoixAvertissement(0);
                     texteXY(44,14,'Oui',Red);
                     texteXY(74,14,'Non',White);
                     deplacerCurseurXY(47,14);
                 end
              else
                  begin
                      creationChoixAvertissement(0);
                      texteXY(44,14,'Oui',White);
                      texteXY(74,14,'Non',Red);
                  end;
          end;
    if (rep = 1) then
       creationPersonnage()
    else
       creationChoix();
end;

procedure creationChoixMenuInterface(vitesse : integer);
begin

     dessinerCadreXY (50,11,70,15,double,White,Black);
     deplacerCurseurXY(60-7,13);
     texteAtemps('Nouvelle partie',vitesse,White);
     dessinerCadreXY (50,16,70,20,double,White,Black);
     deplacerCurseurXY(60-9,18);
     if not (StrToInt(getPersonnageActuelle()) = 1) then
         texteAtemps('Continuer la partie',vitesse,DarkGray)
     else
         texteAtemps('Continuer la partie',vitesse,White);
     dessinerCadreXY (50,21,70,25,double,White,Black);
     deplacerCurseurXY(60-3,23);
     texteAtemps('Quitter',vitesse,White);

end;

procedure creationMenuInterface(vitesse : integer);


begin
    effacerEcran();
    texteXY(15,0,'___  ___   ___   __  __  __  ______  ____ ____     __  __ __ __ __  __ ______  ____ ____ ',White);
    attendre(vitesse);
    texteXY(15,1,'||\\//||  // \\  ||\ || (( \ | || | ||    || \\    ||  || || || ||\ || | || | ||    || \\',White);
    attendre(vitesse);
    texteXY(15,2,'|| \/ || ((   )) ||\\||  \\    ||   ||==  ||_//    ||==|| || || ||\\||   ||   ||==  ||_//',White);
    attendre(vitesse);
    texteXY(15,3,'||    ||  \\_//  || \|| \_))   ||   ||___ || \\    ||  || \\_// || \||   ||   ||___ || \\',White);
    attendre(vitesse);
    texteXY(30,4,'__  __  ____ __    __    __    __   ___   ____  __    ____',White);
    attendre(vitesse);
    texteXY(30,5,'||\ || ||    ||    ||    ||    ||  // \\  || \\ ||    || \\',White);
    attendre(vitesse);
    texteXY(30,6,'||\\|| ||==  \\ /\ //    \\ /\ // ((   )) ||_// ||    ||  ))',White);
    attendre(vitesse);
    texteXY(30,7,'|| \|| ||___  \V/\V/      \V/\V/   \\_//  || \\ ||__| ||_//',White);


end;

procedure creationChoix();
var cho : boolean;
    rep : integer = 1;
    ch : char;

begin

    creationMenuInterface(50);
    creationChoixMenuInterface(20);
    deplacerCurseurXY(60-12,13);
    write('>>');
    deplacerCurseurXY(60-13,13);
    cho := True;
    while (cho= True) do
          begin
              ch := ReadKey;
              case ch of
                  #80 : if not (StrToInt(getPersonnageActuelle()) = 1) then
                            begin
                                if (rep < 3) then
                                   rep := rep + 2
                                else
                                   rep := 1;
                            end
                        else
                            begin
                                if (rep < 3) then
                                   rep := rep + 1
                                else
                                   rep := 1;

                            end;
                  #72 : if not (StrToInt(getPersonnageActuelle()) = 1) then
                           begin
                                if (rep > 1) then
                                   rep := rep - 2
                                else
                                   rep := 3;
                           end
                        else
                           begin
                                if (rep > 1) then
                                   rep := rep - 1
                                else
                                   rep := 3;
                           end;
                  #13 : cho := False;
              end;

              if (rep = 1) then
                 begin

                     creationMenuInterface(0);
                     creationChoixMenuInterface(0);
                     deplacerCurseurXY(60-12,13);
                     write('>>');
                     deplacerCurseurXY(60-13,13)
                 end;
              if (rep = 2) then
                 begin
                     creationMenuInterface(0);
                     creationChoixMenuInterface(0);
                     deplacerCurseurXY(60-12,18);
                     write('>>');
                     deplacerCurseurXY(60-13,18);
                 end;
              if (rep = 3) then
                 begin
                     creationMenuInterface(0);
                     creationChoixMenuInterface(0);
                     deplacerCurseurXY(60-12,23);
                     write('>>');
                     deplacerCurseurXY(60-13,23)
                 end;
          end;
    if (rep = 1) then
       //menuAvertissement();
       saisieTaille();
    if (rep = 2) then
       // Fonction qui ammène au village
    if (rep = 3) then

end;

end.

