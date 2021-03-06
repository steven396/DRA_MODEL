phi_suns=[30,35.5,60,90.5,180];
theta_suns=[30,35.5,60,69.5];
headDirection=0;
test_n=0;
test=[];
for test_j=1:4
    for test_k=1:5
        test_n=test_n+1;
        phi_sun=phi_suns(test_k);
        theta_sun=theta_suns(test_j);
        [response,p1_sum,p2_sum]=calculateResponseOfEveryPhotoreceptorsForRayleigh(phi_sun,theta_sun,headDirection,36);
        test(test_n,:)=response;
    end
end
test=test';
testResults=net(test);
testResults=testResults';
references=[30,35.5,60,90.5,180];
wholeReferences=[];
for test_q=1:4
wholeReferences=[wholeReferences,references];
end
wholeReferences=wholeReferences';
dif=abs(testResults-wholeReferences);
finalResults=[testResults,wholeReferences,dif];
            