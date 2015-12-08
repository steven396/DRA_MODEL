function [response,p1_sum,p2_sum]=calculateResponseOfEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes)
% function [response,p1_sum,p2_sum]=calculateResponseOfEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes,T)
[MatrixOfAngles]=angleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes);
[MatrixOfDegree]=DegreeForEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes);
numberOfEyes=2*numberOfHalfEyes;
for i=1:numberOfEyes
    p_ref=MatrixOfDegree(:,:,i).*cos(2*MatrixOfAngles(:,:,i));
    p1 = (1+p_ref);  
    p2 = (1-p_ref);
    removeUnexsitingValues_p1=find(p1==1);
    p1(removeUnexsitingValues_p1)=0;
   
    removeUnexsitingValues_p2=find(p2==1);
    p2(removeUnexsitingValues_p2)=0;
    
    
    p1_sum(i)=sum(p1(:));
    p2_sum(i)=sum(p2(:));
   
    response(i) = log10(p1_sum(i)./p2_sum(i));


%     p1 = (1+p_ref);
%     removeUnexsitingValues_p1=find(p1==1);
%     p1(removeUnexsitingValues_p1)=0;
%     p1=p1.*MatrixOfIntensity(:,:,i);
%     p2 = (1-p_ref);
%     removeUnexsitingValues_p2=find(p2==1);
%     p2(removeUnexsitingValues_p2)=0;
%     p1=p2.*MatrixOfIntensity(:,:,i);   
%     p1_sum(i)=sum(p1(:));
%     p2_sum(i)=sum(p2(:));
%     response(i) = log10(p1_sum(i)./p2_sum(i));
end
