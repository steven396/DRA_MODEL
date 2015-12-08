function plotAngleBetweenEvectorAndEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes)
% photoreceptorDirections=[pi,pi-pi/6,pi-pi/3,pi-pi/2,pi+pi/3,pi+pi/6,pi,pi-pi/6,pi-pi/3,pi-pi/2,pi+pi/3,pi+pi/6];

photoreceptorDirectionsRight=[];
for k=1:numberOfHalfEyes
    interval=numberOfHalfEyes/2;
    photoreceptorDirectionsRight(k)=pi/2+(k-1)*pi/interval;
end
for i=1:numberOfHalfEyes
    photoreceptorDirection=photoreceptorDirectionsRight(i);
    [P_Angle,xm,ym] = forPlotPolarizationDirectionForRightEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i)=P_Angle;
end

photoreceptorDirectionsLeft=[];
for k=1:numberOfHalfEyes
    interval=numberOfHalfEyes/2;
    photoreceptorDirectionsLeft(k)=pi/2+(k-1)*pi/interval;
end
for i=1:numberOfHalfEyes
    photoreceptorDirection=photoreceptorDirectionsLeft(i);
    [P_Angle,xm,ym] = forPlotPolarizationDirectionForLeftEye(phi_sun,theta_sun,photoreceptorDirection,headDirection);
    MatrixOfAngles(:,:,i+numberOfHalfEyes)=P_Angle;
end

figure
for j=1:72
    subplot(8,9,j);
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