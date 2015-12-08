function [response,p1_sum,p2_sum,response_withIntensity,p1_sum_withIntensity,p2_sum_withIntensity]=calculateResponseOfEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes,T)

% get intersection angle between E-vector of every point in the sky and the
% polarization direction of relevant photoreceptor
[MatrixOfAngles]=angleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes);

% get degree of polarization and sky light intensity of every point within
% the visual field of every relevant photoreceptor (the values of areas out of the visual fields should be zero)
[MatrixOfDegree,MatrixOfIntensity]=DegreeForEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes,T);

% the total number of photoreceptors in two DRAs (left and right)
numberOfEyes=2*numberOfHalfEyes;

% calculate the response of every photoreceptor respectively
for i=1:numberOfEyes
%    horizon response_1 = K*I*(1+d*cos(2*(phi-phi0))) 
%    vertical  response_2 = K*I*(1-d*cos(2*(phi-phi0)))
    p_ref=MatrixOfDegree(:,:,i).*cos(2*MatrixOfAngles(:,:,i));
    p1 = (1+p_ref);
%   zero values become 1, need to be removed.
    removeUnexsitingValues_p1=find(p1==1);
    p1(removeUnexsitingValues_p1)=0;
    p1_withIntensity = p1.*MatrixOfIntensity(:,:,i);
    
    p2 = (1-p_ref);
%   zero values become 1, need to be removed.
    removeUnexsitingValues_p2=find(p2==1);
    p2(removeUnexsitingValues_p2)=0;
    p2_withIntensity = p2.*MatrixOfIntensity(:,:,i);
    
%   add up responses of all photoreceptors
    p1_sum(i)=sum(p1(:));
    p2_sum(i)=sum(p2(:));
    p1_sum_withIntensity(i)=sum(p1_withIntensity(:));
    p2_sum_withIntensity(i)=sum(p2_withIntensity(:));

%   combined action of horizon and vertical channels (log ratio amplifier)
    response(i) = log10(p1_sum(i)./p2_sum(i));
    response_withIntensity(i) = log10(p1_sum_withIntensity(i)./p2_sum_withIntensity(i));
end
