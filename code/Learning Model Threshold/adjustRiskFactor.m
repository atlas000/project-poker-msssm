%% adjustRiskFactor function. Calculates optimal own risk factor based on opponents risk factor

function [newRiskFactor] = adjustRiskFactor(opponentRiskFactor)
    load refSurf; %load 2-variable function which represents all wins for player 1 depending on all riskfactors
    funVector=refSurf(1:90,opponentRiskFactor*100); %create 1 variable function from refSurf at point of opponentRiskFactor
    [~,newRiskFactor] = min(funVector); %find own optimal riskfactor for given opponentRiskFactor
    newRiskFactor = newRiskFactor/100; %set output from function
end