

averageData = zeros(1,9);
 for k=1:1:9
average = 0;
    for i=1:1:100
   average = average + adjustValueData(k,i);
    
    end;
    average = average/100;
    disp(average);
    averageData(1,k) = average;
   
 end;
 save('averageData');