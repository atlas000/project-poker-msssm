function [winner,counter]=game(startCapitalP1,riskFactorP1,startCapitalP2,riskFactorP2,betValue)
%%  UEBERGABEVARIABLEN
           %speichert den Gewinner des Spiels
winner=0;

playerP1=zeros(5,1);
playerP2=zeros(5,1);
playerP1(1)=riskFactorP1;
playerP2(1)=riskFactorP2;
playerP1(2)=startCapitalP1;
playerP2(2)=startCapitalP2;
counter = 0;
GeldverlaufP2=[];   %um den Geldverlauf von P2 zu analysieren
RVerlaufP2=[];      %um den Verlauf von R2 zu analysieren

while playerP1(2) > 0 && playerP2(2) > 0; %Kapital gr?sser als 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    faktor = 1;                     %für bau von regelparameter
    a = playerP2(2); % CapitalP2(i)
    regelParameter1= 0.004*faktor;  %vgl. Zeile 30
    regelParameter2= 0.001*faktor;   %vgl. Zeile 33
    %
    counter = counter + 1;
    decide_who_starts = mod(counter, 2);
    if decide_who_starts == 1
        [playerP1(2),playerP2(2)]=headsup(playerP1(2),playerP1(1),playerP2(2),playerP2(1),betValue); %Simulation einer einzelnen Runde
    else
        [playerP1(2),playerP2(2)]=headsup2(playerP1(2),playerP1(1),playerP2(2),playerP2(1),betValue); %Simulation einer einzelnen Runde
    end;
    %
    b = playerP2(2);        %playerP2 abspeichern
%     GeldverlaufP2(counter)=playerP2(2);
%     RVerlaufP2(counter)=playerP2(1);
    if playerP2(2)>= a       %wenn P2 gewinnt
    elseif playerP2(2)== a-4 %zu agressiv
        playerP2(1)=playerP2(1)+regelParameter1; %anpassung riskfactor
    else                        %zu passiv
        playerP2(1)=playerP2(1)-regelParameter2;
    end;
    if playerP2(2)<=0   %keine negativen
        playerP2(2)=b;
    end;

    %
end;
% subplot(2,1,1)
% title('Progress of Capital')
% plot(1:counter,GeldverlaufP2);
% hold on
% subplot(2,1,2)
% title('Progress of r')
% plot(1:counter,RVerlaufP2);
% hold on
% playerP2(1) %ausgabe
if playerP1(2) == 0
    winner = 0;
elseif playerP2(2) == 0
    winner = 1;
else
    error('Error with headsup')
end
