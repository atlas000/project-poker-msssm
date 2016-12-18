function [winsP1,totalCounter]=main(r1,r2)
% clear all
% clc
%r1=0.6;
%r2=0.1;

%%  Startvariablen, User Inputs


n = 1000; % Anzahl simulierter Spiele

%Playervalues
riskFactorP1 = r1;
riskFactorP2 = r2;
startCapital = 70;  %Startkapital
startCapitalP1 = startCapital;
startCapitalP2 = startCapital;

%Gamevalues
betValue = 1;
blindOn = true;
blindValue = 1;





%%  Auswertungsvariablen

winsP1=0;   % Anzahl Siege Player 1
winsP2=0;   % Anzahl Siege Player 2
totalCounter=0;

totalRounds=0; % Heads up's (Hands played)



%%  Setzen der Spielmatrizen

%   Aufbau der Spieler matrix: [riskFactor, capital, cardValue, currentBet, Losses]


playerP1=[riskFactorP1 startCapitalP1 -1 0 -1];
playerP2=[riskFactorP2 startCapitalP2 -1 0 -1];

%   Aufbau der Game matrix: [betValue, blindOn blindValue]
gameValues=[betValue blindOn blindValue];

%%  Schleife fuer Games
for i=1:n



            [winner,counter]=game(startCapitalP1,r1,startCapitalP2,r2,betValue);%Simulation eines Spieles
            winsP1=winsP1+winner;
            totalCounter=totalCounter+counter;
end
winsP2=n-winsP1;    %neu winsP2 aktualisiert