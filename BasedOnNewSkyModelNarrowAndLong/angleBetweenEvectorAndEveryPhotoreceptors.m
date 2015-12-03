function [MatrixOfAngles]=angleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes)
% photoreceptorDirections=[pi,pi-pi/6,pi-pi/3,pi-pi/2,pi+pi/3,pi+pi/6,pi,pi-pi/6,pi-pi/3,pi-pi/2,pi+pi/3,pi+pi/6];

photoreceptorDirectionsRight=[];
for k=1:(numberOfHalfEyes/2)
    interval=numberOfHalfEyes/2;
    photoreceptorDirectionsRight(k)=0+(k-1)*pi/interval;
end
for k=(numberOfHalfEyes/2+1):numberOfHalfEyes
    interval=numberOfHalfEyes/2;
    photoreceptorDirectionsRight(k)=pi-(k-19)*pi/interval;
end
for i=1:numberOfHalfEyes
    photoreceptorDirection=photoreceptorDirectionsRight(i);
    P_Angle = polarizationDirectionForRightEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i)=P_Angle;
end

photoreceptorDirectionsLeft=[];
for k=1:(numberOfHalfEyes/2)
    interval=numberOfHalfEyes/2;
    photoreceptorDirectionsLeft(k)=pi-k*pi/interval;
end
for k=(numberOfHalfEyes/2+1):numberOfHalfEyes
    interval=numberOfHalfEyes/2;
    photoreceptorDirectionsLeft(k)=0+(k-18)*pi/interval;
end
for i=1:numberOfHalfEyes
    photoreceptorDirection=photoreceptorDirectionsLeft(i);
    P_Angle = polarizationDirectionForLeftEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i+numberOfHalfEyes)=P_Angle;
end

