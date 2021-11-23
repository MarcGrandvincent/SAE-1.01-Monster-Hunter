unit Personnage;

{$mode objfpc}{$H+}
{$I-}
interface

// Lvl

{Modifie le fichier LVL ce qui permet de mettre à jour le lvl du joueur.}
procedure miseAjourLVL(valeur : Integer);
{Renvoie le niveau actuelle du joueur contenu dans son fichier}
function getlvlActuelle() : Integer;

// Exp

{Modifie le fichier exp ce qui permet de mettre à jour l’EXP du joueur.}
procedure miseAjourExp(valeur : Integer);
{Renvoie l’exp actuelle du joueur contenu dans son fichier}
function getExpActuelle() : Integer;
{Vérifie si le joueur à passer un niveau, s’il a passé un niveau, le passe automatiquement}
procedure verifLvlUp();
{Calcule l’exp nécessaire pour le niveau suivant}
function calculLvlSuivant() : Integer;

// Or

{Modifie le fichier or ce qui permet de mettre à jour l’or du joueur. }
procedure miseAjourOr(valeur : Integer);
{Renvoie l’or actuelle du joueur contenu dans son fichier}
function getOrActuelle() : Integer;

// Stats de base

{Calcule les hpmax du joueur}
function calculHpMaxBase() : Integer;
{Calcule l’armure de base du joueur }
function calculArmureBase() : Integer;
{Calcule l'AD de base du joueur}
function calculADBase() : Integer;



// Création personnage

{Modifie le fichier personnage ce qui permet de vérifier si le joueur à un personnage.
On utilise 0 et 1 (0 -> il n’a pas de personnage, 1 ->  il a un personnage)}
procedure miseAjourPersonnage (valeur : integer);
{Renvoie si le joueur à un personnage (0 -> il n’a pas, 1 -> il a)}
function getPersonnageActuelle () : String;
{Modifie le fichier nom qui contient le nom du joueur}
procedure miseAjourNom(valeur : String);
{Renvoie le nom actuelle du joueur contenu dans son fichier}
function getNomActuelle() : String;
{Modifie le fichier sexe qui contient le sexe du joueur}
procedure miseAjourSexe(valeur : String);
{Renvoie le sexe actuelle du joueur contenu dans son fichier}
function getSexeActuelle() : String;
{Modifie le fichier taille qui contient la taille du joueur}
procedure miseAjourTaille(valeur : integer);
{Renvoie la taille actuelle du joueur contenu dans son fichier}
function getTailleActuelle() : Integer;


implementation

uses
    Dos, Classes, SysUtils;

var lvlglobal : Text;
    lvlexp : Text;
    Orglobal : Text;
    Nomact  : Text;
    Sexeact : Text;
    Tailleact : Text;
    Personnageglobal : Text;


//________________________________________________ Zone Lvl
procedure miseAjourLVL(valeur : Integer);
begin
  Assign(lvlglobal,'C:\MHNewWorld\lvl.txt');
  Rewrite(lvlglobal);
  Writeln(lvlglobal,valeur) ;
  Close(lvlglobal);
end;

function getlvlActuelle() : Integer;
var lvl : string;
begin
     Assign(lvlglobal,'C:\MHNewWorld\lvl.txt');
     reset(lvlglobal);
     Readln(lvlglobal,lvl);
     getlvlActuelle := StrToInt(lvl);
     Close(lvlglobal);
end;


//________________________________________________ Zone EXP
procedure miseAjourExp(valeur : Integer);
begin
  Assign(lvlexp,'C:\MHNewWorld\lvlexp.txt');
  Rewrite(lvlexp);
  Writeln(lvlexp,valeur) ;
  Close(lvlexp);
end;

function getExpActuelle() : Integer;
var exp : string;
begin
     Assign(lvlexp,'C:\MHNewWorld\lvlexp.txt');
     reset(lvlexp);
     Readln(lvlexp,exp);
     getExpActuelle := StrToInt(exp);
     Close(lvlexp);
end;

function calculLvlSuivant() : Integer;
begin
     calculLvlSuivant := 900+100*getlvlActuelle();
end;

procedure verifLvlUp();
begin
     if (getExpActuelle() >= calculLvlSuivant()) then
        begin
              miseAjourLVL(getlvlActuelle()+1);
              miseAjourExp(0+getExpActuelle()-(calculLvlSuivant()-100));
        end;
end;

//________________________________________________ Zone Or

procedure miseAjourOr(valeur : Integer);
begin
  Assign(Orglobal,'C:\MHNewWorld\Or.txt');
  Rewrite(Orglobal);
  Writeln(Orglobal,valeur) ;
  Close(Orglobal);
end;

function getOrActuelle() : Integer;
var oract : string;
begin
     Assign(Orglobal,'C:\MHNewWorld\Or.txt');
     reset(Orglobal);
     Readln(Orglobal,oract);
     getOrActuelle := StrToInt(oract);
     Close(Orglobal);
end;


//_________________________________________________ Zone des stats de bas

function calculHpMaxBase() : Integer;
begin
    calculHpMaxBase := 300+(10*getlvlActuelle());
end;

function calculArmureBase() : Integer;
begin
    calculArmureBase := 30+(4*getlvlActuelle());
end;

function calculADBase() : Integer;
begin
    calculADBase := 75+(5*getlvlActuelle());
end;

//__________________________________________________ Création personnage

procedure miseAjourPersonnage(valeur : integer);
begin
  Assign(Personnageglobal,'C:\MHNewWorld\personnage.txt');
  Rewrite(Personnageglobal);
  Writeln(Personnageglobal,valeur) ;
  Close(Personnageglobal);
end;

function getPersonnageActuelle() : String;
var personnage : string;
begin
     Assign(Personnageglobal,'C:\MHNewWorld\personnage.txt');
     reset(Personnageglobal);
     Readln(Personnageglobal,personnage);
     getPersonnageActuelle := personnage;
     Close(Personnageglobal);
end;

procedure miseAjourNom(valeur : String);
begin
  Assign(Nomact,'C:\MHNewWorld\nom.txt');
  Rewrite(Nomact);
  Writeln(Nomact,valeur) ;
  Close(Nomact);
end;

function getNomActuelle() : String;
var nom : string;
begin
     Assign(Nomact,'C:\MHNewWorld\nom.txt');
     reset(Nomact);
     Readln(Nomact,nom);
     getNomActuelle := nom;
     Close(Nomact);
end;

procedure miseAjourSexe(valeur : String);
begin
  Assign(Sexeact,'C:\MHNewWorld\sexe.txt');
  Rewrite(Sexeact);
  Writeln(Sexeact,valeur) ;
  Close(Sexeact);
end;

function getSexeActuelle() : String;
var sexe : string;
begin
     Assign(Sexeact,'C:\MHNewWorld\sexe.txt');
     reset(Sexeact);
     Readln(Sexeact,sexe);
     getSexeActuelle := sexe;
     Close(Sexeact);
end;

procedure miseAjourTaille(valeur : integer);
begin
  Assign(Tailleact,'C:\MHNewWorld\taille.txt');
  Rewrite(Tailleact);
  Writeln(Tailleact,valeur);
  Close(Tailleact);
end;

function getTailleActuelle() : Integer;
var taille : string;
begin
     Assign(Tailleact,'C:\MHNewWorld\taille.txt');
     reset(Tailleact);
     Readln(Tailleact,taille);
     getTailleActuelle := StrToInt(taille);
     Close(Tailleact);
end;

end.
