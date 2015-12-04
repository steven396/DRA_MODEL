function [x,y,z,delta,I_Perez] = RayleighModel(phi_sun,theta_sun,T)
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

phis_I=phi_sun*pi/180;
thetas_I=theta_sun*pi/180;
a_I=linspace(0,2*pi,400);
b_I=linspace(pi/2,0,100);
[phio_I,thetao_I]=meshgrid(a_I,b_I);%phio: azimuth of the observing point; thetao: elevation of the observing point

beitao_I=pi/2-thetao_I;
beitas_I=pi/2-thetas_I;

Ps_1_I=cos(thetas_I)*cos(phis_I);%Position of the sun in space coordinate, x axis
Ps_2_I=cos(thetas_I)*sin(phis_I);% y axis
Ps_3_I=sin(thetas_I);% z axis

Po_1_I=cos(thetao_I).*cos(phio_I);%Position of the observing point in space coordinate, x axis
Po_2_I=cos(thetao_I).*sin(phio_I);%y axis
Po_3_I=sin(thetao_I);%z axis

Pzero_1_I=0;%Position of the origin in space coordinate, x axis
Pzero_2_I=0;%y axis
Pzero_3_I=0;%z axis

Vector_zero_s_1_I=Ps_1_I-Pzero_1_I;%Vector from sun to origin,x axis
Vector_zero_s_2_I=Ps_2_I-Pzero_2_I;%y axis
Vector_zero_s_3_I=Ps_3_I-Pzero_3_I;%z axis

Vector_s_o_1_I=Po_1_I-Ps_1_I;%Vector from sun to observing point,x axis
Vector_s_o_2_I=Po_2_I-Ps_2_I;%y axis
Vector_s_o_3_I=Po_3_I-Ps_3_I;%z axis

Vector_o_zero_1_I=Pzero_1_I-Po_1_I;%Vector from observing point to origin,x axis
Vector_o_zero_2_I=Pzero_2_I-Po_2_I;%y axis
Vector_o_zero_3_I=Pzero_3_I-Po_3_I;%z axis

L_Vector_zero_s_I=sqrt(Vector_zero_s_1_I^2+Vector_zero_s_2_I^2+Vector_zero_s_3_I^2);%module of the Vector_zero_s
L_Vector_s_o_I=sqrt(Vector_s_o_1_I.^2+Vector_s_o_2_I.^2+Vector_s_o_3_I.^2);%module of the Vector_s_o
L_Vector_o_zero_I=sqrt(Vector_o_zero_1_I.^2+Vector_o_zero_2_I.^2+Vector_o_zero_3_I.^2);%module of the Vector_o_zero

so_ozero_I=Vector_s_o_1_I.*Vector_o_zero_1_I+Vector_s_o_2_I.*Vector_o_zero_2_I+Vector_s_o_3_I.*Vector_o_zero_3_I;%Vector_s_o dot Vector_o_zero
L_so_ozero_I=L_Vector_s_o_I.*L_Vector_o_zero_I;%|Vector_s_o| dot | Vector_o_zero |

zeros_ozero_I=Vector_zero_s_1_I.*Vector_o_zero_1_I+Vector_zero_s_2_I.*Vector_o_zero_2_I+Vector_zero_s_3_I.*Vector_o_zero_3_I;%Vector_zero_s dot Vector_o_zero
L_zeros_ozero_I=L_Vector_zero_s_I.*L_Vector_o_zero_I;%|Vector_zero_s| dot |Vector_o_zero|

%k=zeros_ozero./L_zeros_ozero;
abc_I=zeros_ozero_I./L_zeros_ozero_I;
oo_I=find(abc_I<-1);
abc_I(oo_I)=-1;

gamma_I=acos(abc_I);% angle between  Vector_zero_s and Vector_o_zero
gamma_I=pi-gamma_I;

M_Lum=[0.1787,-1.4630;
          -0.3554,0.4275;
          -0.0227,5.3251;
          0.1206,-2.5771;
          -0.0670,0.3703];
      
P_L=M_Lum*[T;1];
A=P_L(1);
B=P_L(2);
C=P_L(3);
D=P_L(4);
E=P_L(5);

   
%gamma=-1*gamma;
F_o=(1+A.*exp(B./cos(beitao_I))).*(1+C.*(exp(D.*gamma_I))+E.*(cos(gamma_I).*cos(gamma_I)));
F_z=(1+A.*exp(B./cos(0))).*(1+C.*(exp(D.*beitas_I))+E.*(cos(beitas_I).*cos(beitas_I)));
F_sun=(1+A.*exp(B./cos(beitas_I))).*(1+C.*(exp(0))+E.*(cos(0).*cos(0)));
F_antis=(1+A.*exp(B./cos(pi/2-beitas_I))).*(1+C.*exp(D.*(pi/2))+E.*(cos(pi/2).*cos(pi/2)));
        
k_I=(4/9-T/120)*(pi-2*beitas_I);
I_Z=(4.0453*T-4.9710)*tan(k_I)-0.2155*T+2.4192;


I_Perez = I_Z*F_o./F_z;
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

















