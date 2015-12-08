function [point_x_left,point_y_left]=CalculateCenterOfCirclesInLeftEye(numberOfHalfEyes)
% sind(10)=0.1736;
% cosd(10)=0.9848;
% center of the circle (0.1736,-0.9848)
% radius of the smaller circle r3=1.35
% calculate the intersaction points of smaller circle and original circle
% [x,y]=solve('x^2+y^2=1','(x-0.1736)^2+(y+0.9848)^2=1.35^2')
% two intersaction points
% point1(-0.966,-0.26), point2(0.996,0.086)

numberOfEyesFL=numberOfHalfEyes/2;%number of points on the smaller circle
r3=1.41;
point5_x=-0.984;
point5_y=-0.179;
point6_x=0.986;
point6_y=0.168;
Point_x_left_1_plus2=linspace(point5_x,point6_x,numberOfEyesFL+2);
point_x_left(1:numberOfEyesFL)=Point_x_left_1_plus2(2:numberOfEyesFL+1);
point_y_left(1:numberOfEyesFL)=sqrt(r3^2-(point_x_left(1:numberOfEyesFL)-0.1736).^2)-0.9848;

% radius of the larger circle r4=1.5
% calculate the intersaction points of larger circle and original circle
% [x,y]=solve('x^2+y^2=1','(x-0.1736)^2+(y+0.9848)^2=1.5^2')
% two intersaction points
% point1(-0.999,-0.049), point2(0.955,0.295)
numberOfEyesSL=numberOfHalfEyes/2;%number of points on the larger circle
r4=1.44;
point7_x=-0.991;
point7_y=-0.137;
point8_x=0.978;
point8_y=0.210;
Point_x_left_2_plus2=linspace(point8_x,point7_x,numberOfEyesFL+2);
point_x_left(numberOfEyesFL+1:numberOfHalfEyes)=Point_x_left_2_plus2(2:numberOfEyesFL+1);
point_y_left(numberOfEyesFL+1:numberOfHalfEyes)=sqrt(r4^2-(point_x_left(numberOfEyesFL+1:numberOfHalfEyes)-0.1736).^2)-0.9848;
