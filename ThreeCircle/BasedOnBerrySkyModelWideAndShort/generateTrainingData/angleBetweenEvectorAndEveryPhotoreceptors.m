function [MatrixOfAngles]=angleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes)

photoreceptorDirectionsRightCircleOne=[];
photoreceptorDirectionsRightCircleTwo=[];
photoreceptorDirectionsRightCircleThree=[];
for k=1:numberOfHalfEyes
%     the polarization angle interval between two adjacent photoreceptors
    interval=pi*2/numberOfHalfEyes;
    photoreceptorDirectionsRightCircleOne(k)=pi/2+(k-1)*interval;
    photoreceptorDirectionsRightCircleTwo(k)=pi/2+(k-1)*interval+5*pi/180;
    photoreceptorDirectionsRightCircleThree(k)=pi/2+(k-1)*interval+pi/18;
end
photoreceptorDirectionsRight=[photoreceptorDirectionsRightCircleOne,photoreceptorDirectionsRightCircleTwo,photoreceptorDirectionsRightCircleThree];
numberOfHalfEyes_all = numberOfHalfEyes*3;
for i=1:numberOfHalfEyes_all
    photoreceptorDirection=photoreceptorDirectionsRight(i);
%     calculate angle between E-vector and the polarization direction of
%     the photoreceptor
    P_Angle = polarizationDirectionForRightEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i)=P_Angle;
end

photoreceptorDirectionsLeftCircleOne=[];
photoreceptorDirectionsLeftCircleTwo=[];
photoreceptorDirectionsLeftCircleThree=[];
for k=1:numberOfHalfEyes
    interval=pi*2/numberOfHalfEyes;
    photoreceptorDirectionsLeftCircleOne(k)=pi/2+(k-1)*interval;
    photoreceptorDirectionsLeftCircleTwo(k)=pi/2+(k-1)*interval+5*pi/180;
    photoreceptorDirectionsLeftCircleThree(k)=pi/2+(k-1)*interval+pi/18;
end
photoreceptorDirectionsLeft=[photoreceptorDirectionsLeftCircleOne,photoreceptorDirectionsLeftCircleTwo,photoreceptorDirectionsLeftCircleThree];
for i=1:numberOfHalfEyes_all
    photoreceptorDirection=photoreceptorDirectionsLeft(i);
    P_Angle = polarizationDirectionForLeftEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i+numberOfHalfEyes_all)=P_Angle;
end

