

highlow = zeros(2,9);
 for k=1:1:9
low = 1;
high = 0;
     for i=1:1:100
        value = adjustValueData(k,i);
  
       if ( value < low)
          low = value;
       end;
  
      if (value > high)
       high = value;
      end;
    
     end;

    highlow(1,k) = high;
   highlow(2,k) = low;
 end;
 save('highlow');