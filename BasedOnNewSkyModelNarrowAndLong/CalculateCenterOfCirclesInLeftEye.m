function [point_x_left,point_y_left]=CalculateCenterOfCirclesInLeftEye(numberOfHalfEyes)
% sind(10)=0.1736;
% cosd(10)=0.9848;
% ?????????0.1736,-0.9848?

% ????????? r3=1.35
% ??????????????
% [x,y]=solve('x^2+y^2=1','(x-0.1736)^2+(y+0.9848)^2=1.35^2')
% ???????????????
% point1(-0.966,-0.26), point2(0.996,0.086)
numberOfEyesFL=numberOfHalfEyes/2;%????????????
r3=1.35;
point5_x=-0.966;
point5_y=-0.26;
point6_x=0.996;
point6_y=0.086;
plus2Point_x_left_1=linspace(point6_x,point5_x,numberOfEyesFL+2);
point_x_left(1:numberOfEyesFL)=plus2Point_x_left_1(2:numberOfEyesFL+1);
point_y_left(1:numberOfEyesFL)=sqrt(r3^2-(point_x_left(1:numberOfEyesFL)-0.1736).^2)-0.9848;
% ????????? r4=1.5
% ??????????????
% [x,y]=solve('x^2+y^2=1','(x-0.1736)^2+(y+0.9848)^2=1.5^2')
% ???????????????
% point1(-0.999,-0.049), point2(0.955,0.295)
numberOfEyesSL=numberOfHalfEyes/2;%????????????
r4=1.5;
point7_x=-0.999;
point7_y=-0.049;
point8_x=0.955;
point8_y=0.295;
plus2Point_x_left_2=linspace(point8_x,point7_x,numberOfEyesFL+2);
point_x_left(numberOfEyesFL+1:numberOfHalfEyes)=plus2Point_x_left_2(2:numberOfEyesFL+1);
point_y_left(numberOfEyesFL+1:numberOfHalfEyes)=sqrt(r4^2-(point_x_left(numberOfEyesFL+1:numberOfHalfEyes)-0.1736).^2)-0.9848;
