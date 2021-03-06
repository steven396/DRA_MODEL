function plotAngleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes)

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
    [P_Angle,xm,ym] = forPlotPolarizationDirectionForRightEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
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
    [P_Angle,xm,ym] = forPlotPolarizationDirectionForLeftEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i+numberOfHalfEyes_all)=P_Angle;
end


figure
for j=1:72*3
    subplot(6,36,j);
%     surf(x,y,z,MatrixOfAngles(:,:,j),'EdgeColor','none');
        % pcolor(x,y,delta_m);
    pcolor(xm,ym,MatrixOfAngles(:,:,j));
    shading interp;
    grid on;
    axis equal;
    %     axis ([-2,2,-2,2]);
    axis ([-1,1,-1,1]);
    hold on;
end