function changePattern(numberOfHalfEyes)
% numberOfHalfEyes=36;

j=0;
headDirection = 0;
for T=4:4
    for theta_sunCount=1:10:90
        disp(theta_sunCount);
        for phi_sunCount=1:10:360
            disp(phi_sunCount);
            j=j+1;
            [response(j,:),p1_sum(j,:),p2_sum(j,:)]=calculateResponseOfEveryPhotoreceptors(phi_sunCount,theta_sunCount,headDirection,numberOfHalfEyes) ;
% [response(j,:),p1_sum(j,:),p2_sum(j,:)]=calculateResponseOfEveryPhotoreceptors(phi_sunCount,theta_sunCount,headDirection,numberOfHalfEyes,T) ;  
    %     eval(['save( ''responseRotated-',num2str(phi_sunCount),'-',num2str(theta_sunCount),''',''responseRotated'',''p1_sum'',''p2_sum'')';]);
        end   
    end
end
% save;
eval(['save( ''responseRotated-',num2str(numberOfHalfEyes),'-',num2str(phi_sunCount),'-',num2str(theta_sunCount),''',''response'',''p1_sum'',''p2_sum'')';]);
% eval(['save( ''responseRotated-',num2str(numberOfHalfEyes),'-',num2str(phi_sunCount),'-',num2str(theta_sunCount),''',''response'',''p1_sum'',''p2_sum'')';]);