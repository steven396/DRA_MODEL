function [point_x_right,point_y_right]=CalculateCenterOfCirclesInRightEye(numberOfHalfEyes)
% sind(10)=0.1736;
% cosd(10)=0.9848;
% ?????????0.1736,0.9848?

% ????????? r1=1.35
% ??????????????
% [x,y]=solve('x^2+y^2=1','(x-0.1736)^2+(y-0.9848)^2=1.35^2')
% ???????????????
% point1(0.996,-0.086), point2(-0.966,0.26)
numberOfEyesFL=numberOfHalfEyes/2;%????????????
r1=1.35;
point1_x=0.996;
point1_y=-0.086;
point2_x=-0.966;
point2_y=0.26;
plus2Point_x_right_1=linspace(point2_x,point1_x,numberOfEyesFL+2);
point_x_right(1:numberOfEyesFL)=plus2Point_x_right_1(2:numberOfEyesFL+1);
point_y_right(1:numberOfEyesFL)=-1*sqrt(r1^2-(point_x_right(1:numberOfEyesFL)-0.1736).^2)+0.9848;
% ????????? r2=1.5
% ??????????????
% [x,y]=solve('x^2+y^2=1','(x-0.1736)^2+(y-0.9848)^2=1.5^2')
% ???????????????
% point1(0.955,-0.295), point2(-0.999,0.049)
numberOfEyesSL=numberOfHalfEyes/2;%????????????
r2=1.5;
point3_x=0.955;
point3_y=-0.295;
point4_x=-0.999;
point4_y=0.049;
plus2Point_x_right_2=linspace(point4_x,point3_x,numberOfEyesSL+2);
point_x_right(numberOfEyesFL+1:numberOfHalfEyes)=plus2Point_x_right_2(2:numberOfEyesFL+1);
point_y_right(numberOfEyesFL+1:numberOfHalfEyes)=-1*sqrt(r2^2-(point_x_right(numberOfEyesFL+1:numberOfHalfEyes)-0.1736).^2)+0.9848;

