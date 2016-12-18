%% Main function. Sets game variables. Calls game function

function [winsP1,totalCounter]=main(r1,r2)

%game variables
betValue = 1; %the amount of "money" a player can bet if he chooses to play
n = 1; % number of games played

%player variables
startCapital = 50; % Amount of "money" the players start with 
startCapitalP1 = startCapital; % init. capital player1
startCapitalP2 = startCapital; % init. capital player2

%result variables
winsP1=0;   % Amount of wins by player1
totalCounter=0;

%loop calling the game function
for i=1:n
    
    %input: needed variables captial, risk factor, bet height
    %output: amount of wins by player1
    [winner,counter]=game(startCapitalP1,r1,startCapitalP2,r2,betValue);
    winsP1=winsP1+winner;
    totalCounter=totalCounter+counter;
end