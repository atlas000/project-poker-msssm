function [fktCardTest] = adjustCardValue(sigma, randValue)

    fktCardTest=-1;
    
    
    while fktCardTest<0 || fktCardTest>1
        fktCardTest=sigma*randn+randValue;
        if (fktCardTest > 1.0 && fktCardTest < 1.1)
            fktCardTest = fktCardTest - 0.1;
        end;
        
        if (fktCardTest > 1.1 && fktCardTest < 1.2)
        fktCardTest = fktCardTest - 0.2;
        end;
        
        if (fktCardTest > -0.1 && fktCardTest < 0)
            fktCardTest = fktCardTest + 0.1;
        end;
        
        if (fktCardTest > -0.2 && fktCardTest < -0.1)
        fktCardTest = fktCardTest + 0.2;
        end;
    end;
