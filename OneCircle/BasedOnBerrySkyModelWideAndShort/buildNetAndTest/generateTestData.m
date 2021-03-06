phi_suns=[30,35.5,60,90.5,180];
theta_suns=[30,35.5,60,69.5];
Ts=[4.5,3.5,6.5];
headDirection=0;
test_n=0;
test=[];
for test_i=1:3
    for test_j=1:4
        for test_k=1:5
            test_n=test_n+1;
            phi_sun=phi_suns(test_k);
            theta_sun=theta_suns(test_j);
            T=Ts(test_i);
            [response,p1_sum,p2_sum,response_withIntensity,p1_sum_withIntensity,p2_sum_withIntensity]=calculateResponseOfEveryPhotoreceptors(phi_sun,theta_sun,headDirection,36,T);
            test(test_n,:)=response_withIntensity;
        end
    end
end
test=test';
testResults=net(test);
testResults=testResults';
references=[30,35.5,60,90.5,180];
wholeReferences=[];
for test_q=1:12
wholeReferences=[wholeReferences,references];
end
wholeReferences=wholeReferences';
dif=abs(testResults-wholeReferences);
finalResults=[testResults,wholeReferences,dif];
            