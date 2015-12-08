function [x,y,z,delta] = RayleighModel(phi_sun,theta_sun)
% function RayleighModel(phi_sun,theta_sun)

phis=phi_sun*pi/180;%Azimuth of the sun
thetas=theta_sun*pi/180;%Elevation of the sun

a=linspace(0,pi*2,400);
% b=linspace(0,pi/2,100);
b=linspace(pi/2,0,100);

[phio,thetao]=meshgrid(a,b);%phio: azimuth of the observing point; thetao: elevation of the observing point

beitao_I=pi/2-thetao;
beitas_I=pi/2-thetas;

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
              
L_Vector_zero_s=sqrt(Vector_zero_s_1^2+Vector_zero_s_2^2+Vector_zero_s_3^2);%module of the Vector_zero_s
L_Vector_o_zero=sqrt(Vector_o_zero_1.^2+Vector_o_zero_2.^2+Vector_o_zero_3.^2);%module of the Vector_o_zero

zeros_ozero=Vector_zero_s_1.*Vector_o_zero_1+Vector_zero_s_2.*Vector_o_zero_2+Vector_zero_s_3.*Vector_o_zero_3;%Vector_zero_s dot Vector_o_zero
L_zeros_ozero=L_Vector_zero_s.*L_Vector_o_zero;%|Vector_zero_s| dot |Vector_o_zero|

gamma_L1=find(L_zeros_ozero==0);
L_zeros_ozero(gamma_L1)=0.001; 

gamma_m=zeros_ozero./L_zeros_ozero;
gamma_oo_I=find(gamma_m<-1);
gamma_m(gamma_oo_I)=-1;
gamma_oo_I=find(gamma_m>1);
gamma_m(gamma_oo_I)=1;

gamma_I=acos(gamma_m);% angle between  Vector_zero_s and Vector_o_zero
% gamma_I=pi-gamma_I;

delta=((sin(gamma_I)).^2)./(1+(cos(gamma_I)).^2);

% polarization degree of the observing point
[x,y,z]=sph2cart(phio,thetao,1);% transform sphere axis to xyz

% figure;
% pcolor(x,y,delta);
% colorbar;
% % caxis([0,1]); 
% % h=colorbar; 
% % set(h,'Ylim',[0,1]);
% shading interp;
% grid on;
% hold on
% plot(Ps_1, Ps_2, 'y.','MarkerSize',30);
% hold off
% text(Ps_1+0.05, Ps_2, 'S','FontSize',15,'color','r','Fontweight','bold');
% % 
% figure;
% pcolor(x,y,I_Perez);
% colorbar;
% % caxis([0,1]); 
% % h=colorbar; 
% % set(h,'Ylim',[0,1]);
% shading interp;
% grid on;
% hold on
% plot(Ps_1, Ps_2, 'y.','MarkerSize',30);
% hold off
% text(Ps_1+0.05, Ps_2, 'S','FontSize',15,'color','r','Fontweight','bold');

















