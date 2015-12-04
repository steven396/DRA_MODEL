function [x,y,z,Dop_new,I_Perez] = WilkieModel(phi_sun,theta_sun,T)

phis=phi_sun*pi/180;%Azimuth of the sun
thetas=theta_sun*pi/180;%Elevation of the sun

a=linspace(0,pi*2,400);
b=linspace(0,pi/2,100);

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
gamma_I=pi-gamma_I;

delta=((sin(gamma_I)).^2)./(1+(cos(gamma_I)).^2);

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
C=1.2;
% D_new=delta.*((beitao_I).*cos(beitao_I).^(1/15)+(pi/2-beitao_I).*I);
D_new=1/C*delta.*((beitao_I).*cos(beitao_I)+(pi/2-beitao_I).*I);

M=exp(-(T-0.6)/4);
Dop_new=M*D_new;

% polarization degree of the observing point
[x,y,z]=sph2cart(phio,thetao,1);% transform sphere axis to xyz

% figure;
% pcolor(x,y,Dop_new);
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

















