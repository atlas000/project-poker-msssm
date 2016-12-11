%% headsup function. Representing one hand played, player1 starts. Calls the function adjustCardValue
function [capP1,capP2,estRiskFactor]=headsup(startCapitalP1,riskFactorP1,startCapitalP2,riskFactorP2,betValue,startRiskFactor)

%transfer of variables
playerP1 = [riskFactorP1 startCapitalP1 rand 0 1.16];
playerP2 = [riskFactorP1 startCapitalP1 rand 0];


% P R E F L O P. First Phase  

%the following line is deactivated if a game is played with blinds.
%then a player is forced to play with his starting hand and he has to put 
%money in the pot.
if playerP1(3) >= playerP1(1) 
   
    %(*) explanation used often throughout the programm
    %tests if player1 has enough capital to bet and if the bet value isn't
    %higher than player2's capital.
    if playerP1(2)>= betValue && betValue<=playerP2(2)                                                 
       playerP1(4) = playerP1(4)+betValue; %adjusting money put in the pot by player1
       playerP1(2) = playerP1(2)-betValue; %adjusting player1's captial
    end
end;

%if the card value is higher than the risk factor, player2 keeps playing
%otherwise he drops out and a new  hand is dealt
if playerP2(3) >= playerP2(1)  
    
    %(**) explanation used often throughout the programm
    %tests if player2 has enough capital to bet and if the bet value isn't
    %higher than player1's capital.
    if playerP2(2)>=betValue && betValue<=playerP1(2)      
        playerP2(4) = playerP2(4)+betValue; %adjusting money put in the pot by player2
        playerP2(2) = playerP2(2)-betValue; %adjusting player2's capital
    end
end;


% F L O P. Second Phase. Three cards are dealt on the table

%tests if no player has dropped out
if playerP1(4) > 0 && playerP2(4) > 0
    
    %Because new cards are dealt the value of the cards must be adjusted
    playerP1(3)=adjustCardValue(.4, playerP1(3));            
    playerP2(3)=adjustCardValue(.4, playerP2(3)); 
    
    %(*)
    if playerP1(3) >= playerP1(1)   
        if playerP1(2)>=0+betValue && betValue<=playerP2(2)      
            playerP1(4) = playerP1(4)+betValue;   
            playerP1(2) = playerP1(2)-betValue;    
        end
    end;

    %(**)
    if playerP2(3) >= playerP2(1)   
        if playerP2(2)>=0+betValue && betValue<=playerP1(2)+playerP1(4)
            playerP2(4) = playerP2(4)+betValue;    
            playerP2(2) = playerP2(2)-betValue;    
        end
    end;
end;


%  T U R N. Third Pase. One new card is dealt on the table

%tests if both are allowed to play this phase
if playerP1(4) == playerP2(4) 
    
    %a new card is dealt, hence the value of the cards must be adjusted
    playerP1(3)=adjustCardValue(.2, playerP1(3));            
    playerP2(3)=adjustCardValue(.2, playerP2(3)); 
                    
    %(*)
    %(***)the 0.1 in the next line lowers the risk factor of a player. This is
    %simulating the case that a player more seldomly drops out when he
    %already has invested some money, so he stays in the game even if the
    %cards aren't up to the standard he wishes them to be
    if playerP1(3) >= (playerP1(1)-0.1)   
        if playerP1(2)>=0+betValue && betValue<=playerP2(2)     
        playerP1(4) = playerP1(4)+betValue;    
        playerP1(2) = playerP1(2)-betValue;    
        end
    end;

    %(**),(***)
    if playerP2(3) >= (playerP2(1)-0.1)   
        if playerP2(2)>=0+betValue && betValue<=playerP1(2)+playerP1(4)       
            playerP2(4) = playerP2(4)+betValue;    
            playerP2(2) = playerP2(2)-betValue;   
        end
    end;
end;


% R I V E R. Fourth phase. A last card is dealt on the table
   
%checks if both players are allowed to play this phase
if playerP1(4) == playerP2(4)    
    
    %the card values have to be adjusted a last time
    playerP1(3)=adjustCardValue(.2, playerP1(3));           
    playerP2(3)=adjustCardValue(.2, playerP2(3)); 
                    
    %(*),(***)
    if playerP1(3) >= (playerP1(1)-0.15) 
        if playerP1(2)>=0+betValue && betValue<=playerP2(2)   
            playerP1(4) = playerP1(4)+betValue;    
            playerP1(2) = playerP1(2)-betValue;    
        end
    end;

    %(**),(***)
    if playerP2(3) >= (playerP2(1)- 0.15)  
        if playerP2(2)>=0+betValue && betValue<=playerP1(2)+playerP1(4)     
            playerP2(4) = playerP2(4)+betValue;   
            playerP2(2) = playerP2(2)-betValue;  
        end
    end;
end;


% S H O W D O W N. If both players stay in until the end they have to show 
%their cards

pot = playerP1(4) + playerP2(4); %putting the money bet in the pot

%player2 drops out. player1 wins. cards are not shown
if playerP1(4) > playerP2(4)
    playerP1(2) = playerP1(2)+pot;
end;

%player1 drops out. player2 wins. cards are not shown
if playerP1(4) < playerP2(4)
    playerP2(2) = playerP2(2)+pot;
end;
    
if playerP1(4) == playerP2(4) %both players want to play until the end
    
    %if player1's cards are better he wins and receives the pot
    if  playerP1(3) > playerP2(3) 
        playerP1(2) = playerP1(2)+pot;
        
        %Learning implementation: if cardvalueP2 lower is than est.
        %risk factor(=Threshold), est. risk factor of p2 is updated
        if playerP2(3)<playerP1(5) && pot == 8
            playerP1(5)=playerP2(3)+0.15;
        end;
     
    %if player2's cards are better he wins and receives the pot    
    elseif playerP1(3) < playerP2(3)
        playerP2(2) = playerP2(2)+pot;
        
        %Learning implementation: if cardvalueP2 is lower than est.
        %risk factor(=Threshold), est. risk factor of p2 is updated
        if playerP2(3)<playerP1(5) && pot == 8 %if cardvalueP2 lower than est. riskfactor(=Threshold)
            playerP1(5)=playerP2(3)+0.15;
        end;
    
    %both players have the same cards. They get back their own money
    elseif playerP1(3) == playerP2(3)
        playerP1(2) = playerP1(2)+pot/2;
        playerP2(2) = playerP2(2)+pot/2;
        
        %Learning implementation: if cardvalueP2 is lower than est.
        %risk factor(=Threshold), est. risk factor of player2 is updated
        if playerP2(3)<playerP1(5) && pot == 8 %if cardvalueP2 lower than est. riskfactor(=Threshold)
            playerP1(5)=playerP2(3)+0.15;
        end;
    end;
end;

%setting the remaining capital and estimated risk factor as the output variables
capP1=playerP1(2);
capP2=playerP2(2);
estRiskFactor=playerP1(5);                                                                           