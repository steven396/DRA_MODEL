% function [P_Angle] =  polarizationDirection(phi_sun,theta_sun,photoreceptorDirection,headDirection)
% function polarizationDirectionForLeftEye(phi_sun,theta_sun,photoreceptorDirection,headDirection)
function [P_Angle] = polarizationDirectionForLeftEye(phi_sun,theta_sun,photoreceptorDirection,headDirection)

headDirection_rad=headDirection*pi/180;

phis=phi_sun*pi/180;%Azimuth of the sun
thetas=theta_sun*pi/180;%Elevation of the sun

a=linspace(0,2*pi,400);
b=linspace(pi/2,0,100);


[phio,thetao]=meshgrid(a,b);%phio: azimuth of the observing point; thetao: elevation of the observing point


Ps_1=cos(thetas)*cos(phis);%Position of the sun in space coordinate, x axis
Ps_2=cos(thetas)*sin(phis);% y axis
Ps_3=sin(thetas);% z axis

Po_1=cos(thetao).*cos(phio);%Position of the observing point in space coordinate, x axis
Po_2=cos(thetao).*sin(phio);%y axis
Po_3=sin(thetao);%z axis

Pzero_1=0;%Position of the origin in space coordinate, x axis
Pzero_2=0;%y axis
Pzero_3=0;%z axis
        
Vector_zero_s_1=Ps_1-Pzero_1;%Vector from sun to origin,x axis
Vector_zero_s_2=Ps_2-Pzero_2;%y axis
Vector_zero_s_3=Ps_3-Pzero_3;%z axis

Vector_o_zero_1=Pzero_1-Po_1;%Vector from observing point to origin,x axis
Vector_o_zero_2=Pzero_2-Po_2;%y axis
Vector_o_zero_3=Pzero_3-Po_3;%z axis
              

Vector_E_1=-(Vector_zero_s_2*Vector_o_zero_3-Vector_zero_s_3*Vector_o_zero_2);%E-Vector of polarized light, x axis
Vector_E_2=-(Vector_zero_s_3*Vector_o_zero_1-Vector_zero_s_1*Vector_o_zero_3);%y axis
% Vector_E_3=-(Vector_zero_s_1*Vector_o_zero_2-Vector_zero_s_2*Vector_o_zero_1);%z axis

% Vector_ref_1_m=cos(pi/6)*cos(photoreceptorDirection)*cos(headDirection_rad)-sin(photoreceptorDirection)*sin(headDirection_rad);
% Vector_ref_2_m=cos(pi/6)*cos(photoreceptorDirection)*sin(headDirection_rad)+sin(photoreceptorDirection)*cos(headDirection_rad);
% 
% Vector_ref_1=Vector_ref_2_m;
% Vector_ref_2=-1*Vector_ref_1_m;
% 
% Vector_ref_3_m=1-Vector_ref_1.^2-Vector_ref_2.^2;
% oo_I=find(Vector_ref_3_m<0);
% Vector_ref_3_m(oo_I)=0;
% Vector_ref_3=sqrt(Vector_ref_3_m);
ref_derection = headDirection_rad + photoreceptorDirection;
% kkkppp=ref_derection*180/pi;
Vector_ref_1 = cos(ref_derection);
Vector_ref_2 = sin(ref_derection);

L_Vector_E=sqrt(Vector_E_1.^2+Vector_E_2.^2);%module of Vector_E
L_Vector_ref=1;

% %Avoid zero denominators
L1=find(L_Vector_E==0);
L_Vector_E(L1)=0.001; 

E_i=Vector_E_1.*Vector_ref_1+Vector_E_2.*Vector_ref_2;%Vector_E dot ref
L_E_i=L_Vector_E.*L_Vector_ref;%|Vector_E| dot |ref|

L2=E_i./L_E_i;
oo_I=find(L2<-1);
L2(oo_I)=-1;
oo_I=find(L2>1);
L2(oo_I)=1;

P_Angle=acos(L2);%angle between Vector_E and reference
% 
% figure;
% P_Angle=P_Angle*180/pi;
% [x,y,z]=sph2cart(phio,thetao,1);% transform sphere axis to xyz
% [xTh,yTh,zTh]=sph2cart(phio,thetao,1/2);
% xm=xTh./(zTh+1/2);
% ym=yTh./(zTh+1/2);
% 
% pcolor(xm,ym,P_Angle);
% % pcolor(x,y,P_Angle);
% shading interp;
