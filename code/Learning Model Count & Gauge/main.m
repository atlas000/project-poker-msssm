%% Main function. Sets game variables. Calls game function

function [winsP1,nrounds]=main(r1,r2)

%game variables
betValue = 1; %the amount of "money" a player can bet if he chooses to play
n = 100; % number of games played
start = 15;   %  After how many rounds the evaluation of the oponents riskfaktor starts
evaluation =(1/100)*[37;40;44;39;36;40;41;41;41;40;39;39;35;40;39;42;43;38;41;41;44;46;38;43;43;45;43;46;45;44;42;46;43;42;45;46;46;46;46;46;44;48;46;48;46;49;48;48;46;44;45;46;38;45;43;43;36;37;29;34;32;32;33;28;28;23;15;9;18;2;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;1;1;1;1;1;1;1;1;1;1;1];
totalRounds=0; % Heads up's (Hands played)

%player variables
startCapital = 50; % Amount of "money" the players start with 
startCapitalP1 = startCapital; % init. capital player1
startCapitalP2 = startCapital; % init. capital player2

%result variables
winsP1=0;   % Amount of wins by player1

%loop calling the game function
for i=1:n
    
    %input: needed variables capital, risk factor, bet height
    %output: amount of wins by player1
   [winner,counter]=game(startCapitalP1,r1,startCapitalP2,r2,betValue,start);
    winsP1=winsP1+winner;
    totalRounds = totalRounds +counter;
end

nrounds=totalRounds/n;
