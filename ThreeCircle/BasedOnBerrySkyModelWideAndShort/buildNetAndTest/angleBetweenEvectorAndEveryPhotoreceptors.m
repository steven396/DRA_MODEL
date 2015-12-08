function [MatrixOfAngles]=angleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes)

photoreceptorDirectionsRight=[];
for k=1:numberOfHalfEyes
%     the polarization angle interval between two adjacent photoreceptors
    interval=pi*2/numberOfHalfEyes;
    photoreceptorDirectionsRight(k)=pi/2+(k-1)*interval;
end
for i=1:numberOfHalfEyes
    photoreceptorDirection=photoreceptorDirectionsRight(i);
%     calculate angle between E-vector and the polarization direction of
%     the photoreceptor
    P_Angle = polarizationDirectionForRightEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i)=P_Angle;
end

photoreceptorDirectionsLeft=[];
for k=1:numberOfHalfEyes
    interval=pi*2/numberOfHalfEyes;
    photoreceptorDirectionsLeft(k)=pi/2+(k-1)*interval;
end
for i=1:numberOfHalfEyes
    photoreceptorDirection=photoreceptorDirectionsLeft(i);
    P_Angle = polarizationDirectionForLeftEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i+numberOfHalfEyes)=P_Angle;
end

