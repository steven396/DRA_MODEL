% function [x,y,Dop_new,Ps_1,Ps_2] = NewSkyModel(phi_sun,theta_sun,xigema,T,Spectra)
% function NewSkyModel(phi_sun,theta_sun,xigema,T)
%default xigema = 40(split parameter); T(turbidity); Spectra(wavelength, 1 means whole wavelength)

% function [x,y,z,Dop_new,I_Perez] = NewSkyModelWithoutSpectral(phi_sun,theta_sun,xigema,T)
function  forPlotNewSkyModelWithoutSpectral(phi_sun,theta_sun,xigema,T)
phis=phi_sun*pi/180;%Azimuth of the sun
thetas=theta_sun*pi/180;%Elevation of the sun
A=tan(xigema*pi/180/4);%spilt parameter. In Dennis & Berry's paper, but not accurate one.

a=linspace(0,2*pi,400);
b=linspace(pi/2,0,100);
[phio,thetao]=meshgrid(a,b);

%Model from Dennis and Berry
rs=(1-tan(thetas/2))./(1+tan(thetas/2));
Ps_1=rs.*cos(phis);%xs
Ps_2=rs.*sin(phis);%ys

ro=(1-tan(thetao/2))./(1+tan(thetao/2));
Po_1=ro.*cos(phio);%xo
Po_2=ro.*sin(phio);%yo
        
kesi=Po_1+i*Po_2;
%positions of 4 nueral points
kesi1=((Ps_1+A*cos(phis))./(1-A*cos(phis).*Ps_1))+((Ps_2+A*sin(phis))./(1-A*sin(phis).*Ps_2))*i;
kesi2=((Ps_1-A*cos(phis))./(1+A*cos(phis).*Ps_1))+((Ps_2-A*sin(phis))./(1+A*sin(phis).*Ps_2))*i;
kesi3=-1./conj(kesi1);
kesi4=-1./conj(kesi2);

%-4???
w=(-4*(kesi-kesi1).*(kesi-kesi2).*(kesi-kesi3).*(kesi-kesi4))./((1+ro.^2).^2.*abs(kesi1-kesi3).*abs(kesi2-kesi4));
%in Dennis and Berry's paper
%figure 3 (a)
%h=1;
%figure 3(b)
%h=cos(pi.*ro./2).^(1/10);
%figure 3(c)
%h=cos(pi.*ro./2).^(1/30);
%figure 7
%h=(1+0.35*ro.^2+0.65*ro.^4).*(1-ro.^2);

%w=w.*h;
delta=abs(w);

%------------------------Model for Intensity of sky light
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


I_Perez=I_Z*F_o./F_z;
I_sun=I_Z*F_sun/F_z;
I_antis=I_Z*F_antis/F_z;

I=(1./I_Perez-1./I_sun).*I_antis.*I_sun./(I_sun-I_antis);      

D_new=delta.*((beitao_I).*cos(beitao_I).^(1/15)+(pi/2-beitao_I).*I);

noZero_D_new=find(D_new==0);
D_new(noZero_D_new)=0.00001;

%M=exp(-(T-0.6)/5);
% M=exp(-(T+17)/22);
% ppp=thetao-thetas;
% oo_I2=find(ppp==0);
% ppp(oo_I2)=0.01;
% ppp=abs(ppp);
% qaz = 0.3;
% Dop_new=M*D_new+M*D_new.*(sin(ppp))*qaz;

% M=exp(-(T+17)/22);
M=exp(-(T-0.6)/4);
Dop_new=M*D_new;

%------------------------Code for figure
[x,y,z]=sph2cart(phio_I,thetao_I,1);
% [xTh,yTh,zTh]=sph2cart(phio_I,thetao_I,1/2);
% 
% 
% x=xTh./(zTh+1/2);
% y=yTh./(zTh+1/2);
% 
% figure;
% contour(x,y,Dop_new,40);
% %pcolor(x,y,D_new);
% colorbar;
% caxis([0,1]); 
% h=colorbar; 
% set(h,'Ylim',[0,1]);
% shading interp;
% grid on;
% hold on
% plot(Ps_1, Ps_2, 'y.','MarkerSize',30);
% hold off
% text(Ps_1+0.05, Ps_2, 'S','FontSize',15,'color','r','Fontweight','bold');
% 
% % 
figure;
pcolor(x,y,Dop_new);
colorbar;
% caxis([0,1]); 
% h=colorbar; 
% set(h,'Ylim',[0,1]);
shading interp;
grid on;
hold on
plot(Ps_1, Ps_2, 'y.','MarkerSize',30);
hold off
text(Ps_1+0.05, Ps_2, 'S','FontSize',15,'color','r','Fontweight','bold');
% % 
figure;
pcolor(x,y,I_Perez);
colorbar;
% caxis([0,1]); 
% h=colorbar; 
% set(h,'Ylim',[0,1]);
shading interp;
grid on;
hold on
plot(Ps_1, Ps_2, 'y.','MarkerSize',30);
hold off
text(Ps_1+0.05, Ps_2, 'S','FontSize',15,'color','r','Fontweight','bold');



















