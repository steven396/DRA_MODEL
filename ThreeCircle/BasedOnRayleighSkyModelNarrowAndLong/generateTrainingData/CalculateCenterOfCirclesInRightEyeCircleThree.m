function [point_x_right,point_y_right]=CalculateCenterOfCirclesInRightEyeCircleThree(numberOfHalfEyes)
% sind(10)=0.1736;
% cosd(10)=0.9848;
% center of the circle (0.1736,0.9848)

% radius of the smaller circle r1=1.35
% calculate the intersaction points of smaller circle and original circle
% [x,y]=solve('x^2+y^2=1','(x-0.1736)^2+(y-0.9848)^2=1.35^2')
% two intersaction points
% point1(0.996,-0.086), point2(-0.966,0.26)
numberOfEyesFL=numberOfHalfEyes/2;%number of points on the smaller circle
r1=1.41;
point1_x=0.986;
point1_y=-0.168;
point2_x=-0.984;
point2_y=0.179;
Point_x_right_1_plus2=linspace(point2_x,point1_x,numberOfEyesFL+2);
point_x_right(1:numberOfEyesFL)=Point_x_right_1_plus2(2:numberOfEyesFL+1);
point_y_right(1:numberOfEyesFL)=-1*sqrt(r1^2-(point_x_right(1:numberOfEyesFL)-0.1736).^2)+0.9848;
% radius of the larger circle r2=1.5
% calculate the intersaction points of larger circle and original circle
% [x,y]=solve('x^2+y^2=1','(x-0.1736)^2+(y-0.9848)^2=1.5^2')
% two intersaction points
% point1(0.955,-0.295), point2(-0.999,0.049)
numberOfEyesSL=numberOfHalfEyes/2;%number of points on the larger circle
r2=1.44;
point3_x=0.978;
point3_y=-0.210;
point4_x=-0.991;
point4_y=0.137;
Point_x_right_2_plus2=linspace(point3_x,point4_x,numberOfEyesSL+2);
point_x_right(numberOfEyesFL+1:numberOfHalfEyes)=Point_x_right_2_plus2(2:numberOfEyesFL+1);
point_y_right(numberOfEyesFL+1:numberOfHalfEyes)=-1*sqrt(r2^2-(point_x_right(numberOfEyesFL+1:numberOfHalfEyes)-0.1736).^2)+0.9848;

