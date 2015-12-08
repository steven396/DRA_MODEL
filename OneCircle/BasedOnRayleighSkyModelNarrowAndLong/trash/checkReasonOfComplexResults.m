kkk=[];
iii=[];
mmm=[];
for i=1:90
[jjj,ppp,MatrixOfIntensity]=testOfCalculateResponseOfEveryPhotoreceptors(0,i,0,36,2);
kkk=[kkk;ppp];
mmm=[mmm;jjj];
iii=[iii;MatrixOfIntensity];
disp(i);
end
save 'mmm.mat' mmm;
save 'kkk.mat' kkk;
save 'iii.mat' iii;