allDataWins=zeros(90,90);
allDataHands=zeros(90,90);
pool=parpool(12);
for r1=1:1:90
    disp(r1);
    parfor r2=1:1:90
        [allDataWins(r1,r2),allDataHands(r1,r2)]=main(r1/100,r2/100);
        
    end
end
save('allData_P1_r1_1_30_r2_1_90');
delete(pool);