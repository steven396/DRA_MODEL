function [MatrixOfDegree,MatrixOfIntensity]=DegreeForEveryPhotoreceptors(phi_sun,theta_sun,headDirection,numberOfHalfEyes,T)
% function [MatrixOfDegree,x,y,z]=DegreeForEveryPhotoreceptors(phi_sun,theta_sun,headDirection)
% [x,y,z,delta]=CalculateRayleighModel(phi_sun,theta_sun);

[x,y,z,delta,Intensity] = NewSkyModelWithoutSpectral(phi_sun,theta_sun,40,T);
% delta=delta*1.2;
[point_x_0_right,point_y_0_right]=CalculateCenterOfCirclesInRightEye(numberOfHalfEyes);
[point_x_0_left,point_y_0_left]=CalculateCenterOfCirclesInLeftEye(numberOfHalfEyes);
% save point_x_0.mat;
% save point_y_0.mat;
headDirection_rad=headDirection*pi/180;
Rtheta=headDirection_rad;

for j=1:numberOfHalfEyes
    delta_m_right = delta;
    Intensity_m_right = Intensity;
%     delta_m((x.*cos(-Rtheta)-y.*sin(-Rtheta)-point_x_0(j)).^2*9+12*((x.*sin(-Rtheta)+y.*cos(-Rtheta))-point_y_0(j)).^2>1)=0;
    delta_m_right((x.*cos(Rtheta)+y.*sin(Rtheta)-point_x_0_right(j)).^2*9+16*((y.*cos(Rtheta)-x.*sin(Rtheta))-point_y_0_right(j)).^2>1)=0;
    Intensity_m_right((x.*cos(Rtheta)+y.*sin(Rtheta)-point_x_0_right(j)).^2*9+16*((y.*cos(Rtheta)-x.*sin(Rtheta))-point_y_0_right(j)).^2>1)=0;
    %     delta_m = delta_m_right;
%     delta_m_1((x.*cos(Rtheta)+y.*sin(Rtheta)).^2*4+(y.*cos(Rtheta)-x.*sin(Rtheta)+sqrt(3)/4).^2*16/3>1)=0;
%     Intensity_m((x.*cos(Rtheta)+y.*sin(Rtheta)-point_x_0(j)).^2*9+12*((-1*x.*sin(Rtheta)+y.*cos(Rtheta))-point_y_0(j)).^2>1)=0;
    MatrixOfDegree(:,:,j)=delta_m_right;
    MatrixOfIntensity(:,:,j)=Intensity_m_right;
end
for j=1:numberOfHalfEyes
    delta_m_left = delta;
    Intensity_m_left = Intensity;
    delta_m_left((x.*cos(Rtheta)+y.*sin(Rtheta)-point_x_0_left(j)).^2*9+16*((y.*cos(Rtheta)-x.*sin(Rtheta))-point_y_0_left(j)).^2>1)=0;
    Intensity_m_left((x.*cos(Rtheta)+y.*sin(Rtheta)-point_x_0_left(j)).^2*9+16*((y.*cos(Rtheta)-x.*sin(Rtheta))-point_y_0_left(j)).^2>1)=0;
    MatrixOfDegree(:,:,j+numberOfHalfEyes)=delta_m_left;
    MatrixOfIntensity(:,:,j+numberOfHalfEyes)=Intensity_m_left;
end


% i=-6:17
%     j=i+12
%     xn=x;
%     yn=y;
%     zn=z;
%     Rtheta=i*pi/12;
%     Rtheta_2=j*pi/12;
%     delta_m_1 = delta;
%     delta_m_1((x.*cos(Rtheta)+y.*sin(Rtheta)-sqrt(3)/4).^2*16/3+(x.*sin(Rtheta)-y.*cos(Rtheta)).^2*4>1)=0;
%     delta_m_2=delta;
%     delta_m_2((x.*cos(Rtheta_2)+y.*sin(Rtheta_2)-sqrt(3)/4).^2*16/3+(x.*sin(Rtheta_2)-y.*cos(Rtheta_2)).^2*4>1)=0;