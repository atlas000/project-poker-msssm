clear all;
close all;

%% This File should run the function until one player wins.


%Risikobereitschaft der Spieler. Umso tiefer die Zahl, umso mehr Risiko
%nimmt ein Spieler
RiskP1 = 0.5;
RiskP2 = 0.2;
 
%Variablen zum zwischenspeichern der Kapitale von jedem Spieler nach einer
%gespielten Runde. Dienen als Laufvariable der while-Schleife
LaufP1= 1;
LaufP2 = 1;
Counter = 0;
Geldverlauf = [];
CP1=20;
CP2=20;
%Jeder durchlauf der while-Schleife entspricht einer gespielten Runde
%Abbruchbedingung: Ein Spieler hat kein Kapital mehr <-> LaufP1 oder LaufP2
%ist 0


while LaufP1 > 0 && LaufP2 > 0;
    Counter = Counter + 1;
    [EndCreditP1,EndCreditP2,Tempx,TempPot] = headsup(CP1,CP2,RiskP2,RiskP2)
    CP1=EndCreditP1
    CP2=EndCreditP2
     
    %Poker_v2[CP1, CP2]cC
    LaufP1 = EndCreditP1;
    LaufP2 = EndCreditP2;
    Geldverlauf(Counter) = EndCreditP1;
    %Plot Geldverlauf
 
 
end;
Q=1:Counter;
plot (Q, Geldverlauf)
