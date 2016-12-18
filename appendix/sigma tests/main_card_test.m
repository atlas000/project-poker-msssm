%sigma von 0.1 bis 1
%randValue von 0.1 bis 1
adjustValueData=zeros(10,100);
r3 = 1;
for r1=1:1:10
 
    for r2=1:1:100
        adjustValueData(r3,r2)=fktCardTest(0.3,r1/10);
    end
    r3 = r3 + 1;
end;
save('adjustValueData');
