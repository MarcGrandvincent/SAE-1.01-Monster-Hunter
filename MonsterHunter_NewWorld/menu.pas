unit menu;

{$mode objfpc}{$H+}
{$codepage UTF8}

interface

{Appelle le menu avertissement }
procedure menuAvertissement();
{Création des choix pour le menu avertissement }
procedure creationChoixAvertissement(vitesse : integer);
{création de l’interface du menu, on peut choisir la vitesse de création}
procedure creationMenuInterface(vitesse : integer);
{création des choix pour le menu interface, on peut choisir la vitesse de création}
procedure creationChoixMenuInterface(vitesse : integer);
{Créer le menu}
procedure creationChoix();

implementation

uses
  Classes, SysUtils,personnage,personageIHM,GestionEcran,gestionTexte,crtPerso,villageIHM,inventaireLogic;






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
    creationChoixAvertissement(30);
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
                            rep := 1; // si rep est au dessus de 2 on renvoie à 1
                   #77 : if (rep > 1) then
                            rep := rep - 1
                         else
                            rep := 2; // si rep est au dessus de 2 on renvoie à 1
                   #13 : cho := False; // Le joueur à fait sa décision
              end;



              if (rep = 1) then
                 begin
                     texteXY(44,14,'Oui',Red);
                     texteXY(74,14,'Non',White);
                     deplacerCurseurXY(47,14);
                 end
              else
                  begin
                      texteXY(44,14,'Oui',White);
                      texteXY(74,14,'Non',Red);
                  end;
          end;
    if (rep = 1) then
       creationPersonnage() // On appelle le menu de création de personnage
    else
       creationChoix(); // On appelle le menu
end;

procedure creationChoixMenuInterface(vitesse : integer);
begin

     dessinerCadreXY (50,11,70,15,double,White,Black);
     deplacerCurseurXY(60-7,13);
     texteAtemps('Nouvelle partie',vitesse,White);
     dessinerCadreXY (50,16,70,20,double,White,Black);
     deplacerCurseurXY(60-9,18);
     if not (getPersonnageActuelle() = 1) then
         texteAtemps('Continuer la partie',vitesse,DarkGray)
     else
         texteAtemps('Continuer la partie',vitesse,White);
     dessinerCadreXY (50,21,70,25,double,White,Black);
     deplacerCurseurXY(60-3,23);
     texteAtemps('Quitter',vitesse,White);
     deplacerCurseurXY(60-26,26);
     texteAtemps('(pour naviguer, utiliser les touches directionnelles',0,DarkGray);
     deplacerCurseurXY(60-18,27);
     texteAtemps('et entree pour valider votre action)',0,DarkGray);
     couleurTexte(White);

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
                  #80 : if not (getPersonnageActuelle() = 1) then // Si le joueur n'a pas été créer, alors on ne peut pas aller sur continuer
                            begin
                                if (rep < 3) then
                                   rep := rep + 2
                                else
                                   rep := 1; // si rep est au dessus de 3 on renvoie à 1
                            end
                        else
                            begin
                                if (rep < 3) then
                                   rep := rep + 1
                                else
                                   rep := 1; // si rep est au dessus de 3 on renvoie à 1

                            end;
                  #72 : if not (getPersonnageActuelle() = 1) then // Si le joueur n'a pas été créer, alors on ne peut pas aller sur continuer
                           begin
                                if (rep > 1) then
                                   rep := rep - 2
                                else
                                   rep := 3; // si rep est au dessus de 3 on renvoie à 1
                           end
                        else
                           begin
                                if (rep > 1) then
                                   rep := rep - 1
                                else
                                   rep := 3; // si rep est au dessus de 3 on renvoie à 1
                           end;
                  #13 : cho := False; // Le joueur à fait sa décision
              end;

              if (rep = 1) then
                 begin
                     texteXY(60-12,13,'>>',White);
                     texteXY(60-12,23,'  ',White);
                     texteXY(60-12,18,'  ',White);
                     deplacerCurseurXY(60-13,13);
                 end;
              if (rep = 2) then
                 begin
                     texteXY(60-12,18,'>>',White);
                     texteXY(60-12,23,'  ',White);
                     texteXY(60-12,13,'  ',White);
                     deplacerCurseurXY(60-13,18);
                 end;
              if (rep = 3) then
                 begin
                     texteXY(60-12,23,'>>',White);
                     texteXY(60-12,13,'  ',White);
                     texteXY(60-12,18,'  ',White);
                     deplacerCurseurXY(60-13,23);
                 end;
          end;
    if (rep = 1) then
       menuAvertissement() // On appelle le menu avertissement
    else if (rep = 2) then
       begin
            recupInventaire(personnage1); // on recupere l'inventaire
            choixMenuVillage(); // On appelle le village
       end
    else if (rep = 3) then
       halt;

end;

end.

