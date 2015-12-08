function [MatrixOfAngles]=angleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes)
% photoreceptorDirections=[pi,pi-pi/6,pi-pi/3,pi-pi/2,pi+pi/3,pi+pi/6,pi,pi-pi/6,pi-pi/3,pi-pi/2,pi+pi/3,pi+pi/6];

photoreceptorDirectionsRightCircleOne=[];
photoreceptorDirectionsRightCircleTwo=[];
photoreceptorDirectionsRightCircleThree=[];
for k=1:numberOfHalfEyes
    interval=pi*2/numberOfHalfEyes;
    photoreceptorDirectionsRightCircleOne(k)=0+(k-1)*interval;
    photoreceptorDirectionsRightCircleTwo(k)=0+(k-1)*interval+5*pi/180;
    photoreceptorDirectionsRightCircleThree(k)=0+(k-1)*interval+pi/18;
end
photoreceptorDirectionsRight=[photoreceptorDirectionsRightCircleOne,photoreceptorDirectionsRightCircleTwo,photoreceptorDirectionsRightCircleThree];

numberOfHalfEyes_all = numberOfHalfEyes*3;
for i=1:numberOfHalfEyes_all
    photoreceptorDirection=photoreceptorDirectionsRight(i);
    P_Angle = polarizationDirectionForRightEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i)=P_Angle;
end

photoreceptorDirectionsLeftCircleOne=[];
photoreceptorDirectionsLeftCircleTwo=[];
photoreceptorDirectionsLeftCircleThree=[];

for k=1:numberOfHalfEyes
    interval=pi*2/numberOfHalfEyes;
    photoreceptorDirectionsLeftCircleOne(k)=0+(k-1)*interval;
    photoreceptorDirectionsLeftCircleTwo(k)=0+(k-1)*interval+5*pi/180;
    photoreceptorDirectionsLeftCircleThree(k)=0+(k-1)*interval+pi/18;
end
photoreceptorDirectionsLeft=[photoreceptorDirectionsLeftCircleOne,photoreceptorDirectionsLeftCircleTwo,photoreceptorDirectionsLeftCircleThree];
for i=1:numberOfHalfEyes_all
    photoreceptorDirection=photoreceptorDirectionsLeft(i);
    P_Angle = polarizationDirectionForLeftEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i+numberOfHalfEyes_all)=P_Angle;
end

