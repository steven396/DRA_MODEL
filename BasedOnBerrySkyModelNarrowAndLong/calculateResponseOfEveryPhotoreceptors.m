function [response,p1_sum,p2_sum,response_withIntensity,p1_sum_withIntensity,p2_sum_withIntensity]=calculateResponseOfEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes,T)
% function [response,p1_sum,p2_sum]=calculateResponseOfEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes,T)
[MatrixOfAngles]=angleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes);
[MatrixOfDegree,MatrixOfIntensity]=DegreeForEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes,T);
numberOfEyes=2*numberOfHalfEyes;
for i=1:numberOfEyes
    p_ref=MatrixOfDegree(:,:,i).*cos(2*MatrixOfAngles(:,:,i));
    p1 = (1+p_ref);
    removeUnexsitingValues_p1=find(p1==1);
    p1(removeUnexsitingValues_p1)=0;
    p1_withIntensity = p1.*MatrixOfIntensity(:,:,i);
    
    p2 = (1-p_ref);
    removeUnexsitingValues_p2=find(p2==1);
    p2(removeUnexsitingValues_p2)=0;
    p2_withIntensity = p2.*MatrixOfIntensity(:,:,i);
    
    p1_sum(i)=sum(p1(:));
    p2_sum(i)=sum(p2(:));
    p1_sum_withIntensity(i)=sum(p1_withIntensity(:));
    p2_sum_withIntensity(i)=sum(p2_withIntensity(:));
    response(i) = log10(p1_sum(i)./p2_sum(i));
    response_withIntensity(i) = log10(p1_sum_withIntensity(i)./p2_sum_withIntensity(i));


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
