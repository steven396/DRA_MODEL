a0=0;
b0=0;
r0=1;
theta=0:pi/50:2*pi;
x=a0+r0*cos(theta);
y=b0+r0*sin(theta);

a1=sind(10);
b1=cosd(10);
r1=sqrt((1-a1)^2+(0-b1)^2);
x1=a1+r1*cos(theta);
y1=b1+r1*sin(theta);

r2=r1+0.1;
x2=a1+r2*cos(theta);
y2=b1+r2*sin(theta);

a2=sind(10);
b2=-1*cosd(10);
r3=sqrt((1-a2)^2+(0-b2)^2);
x3=a2+r3*cos(theta);
y3=b2+r3*sin(theta);

r4=r3+0.1;
x4=a2+r4*cos(theta);
y4=b2+r4*sin(theta);

plot(x,y,'-',a0,b0,'.');
axis square;
axis ([-1,1,-1,1]);
hold on;
plot(x1,y1,'-',a1,b1,'.');
plot(x2,y2,'-',a1,b1,'.');
plot(x3,y3,'-',a2,b2,'.');
plot(x4,y4,'-',a2,b2,'.');


