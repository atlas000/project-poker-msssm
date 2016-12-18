
totalDeviation = 0;
temp3 = 0;

 for i = 1:1:9
    
    temp = averageData(1,i);
    temp = temp - (i/10);
    temp2 = abs(temp);
    temp3 = temp3 + temp2;
    
 end;
totalDeviation = temp3/9