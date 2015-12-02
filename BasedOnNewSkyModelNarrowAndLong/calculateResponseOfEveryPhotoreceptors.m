function [response,p1_sum,p2_sum]=calculateResponseOfEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes,T)
[MatrixOfAngles]=angleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes);
[MatrixOfDegree,MatrixOfIntensity]=DegreeForEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes,T);
numberOfEyes=2*numberOfHalfEyes;
for i=1:numberOfEyes
    p_ref=MatrixOfDegree(:,:,i).*cos(2*MatrixOfAngles(:,:,i));
%     p1 = (1+p_ref).*MatrixOfIntensity(:,:,i);
%     p2 = (1-p_ref).*MatrixOfIntensity(:,:,i);
    p1 = (1+p_ref);
    p2 = (1-p_ref);
    p1_sum(i)=sum(p1(:));
    p2_sum(i)=sum(p2(:));
    response(i) = log10(p1_sum(i)./p2_sum(i));
end
