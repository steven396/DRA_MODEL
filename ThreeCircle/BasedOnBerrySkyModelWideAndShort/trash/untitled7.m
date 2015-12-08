kkk=[];
iii=[];
for i=1:90
[ppp,MatrixOfIntensity]=test(0,i,0,36,8);
kkk=[kkk;ppp];
iii=[iii;MatrixOfIntensity];
disp(i);
end
save 'kkk.mat' kkk;
save 'iii.mat' iii;