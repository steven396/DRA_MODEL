function [point_x_left,point_y_left]=CalculateCenterOfCirclesInLeftEyeCircleTwo(numberOfHalfEyes)
k1 = 1/2;
k2 = sqrt(3)/4;
rate = 1/3;

extraInside_1=k1*2*rate*rate;
extraInside_2=k2*2*rate*rate;

p1_x_left=0;
p1_y_left=k2*rate+extraInside_2;
p2_x_left=k1*(1-rate)-extraInside_1;
p2_y_left=k2;
p3_x_left=0;
p3_y_left=k2+2*k2*rate-extraInside_2;
p4_x_left=-1*p2_x_left;
p4_y_left=p2_y_left;

point_x_left=zeros(1,numberOfHalfEyes);
point_y_left=zeros(1,numberOfHalfEyes);


numberOfEyesInOneInterval=numberOfHalfEyes/4;
pointNumberOne=1;
pointNumberTwo=pointNumberOne+numberOfEyesInOneInterval;
pointNumberThree=pointNumberTwo+numberOfEyesInOneInterval;
pointNumberFour=pointNumberThree+numberOfEyesInOneInterval;

for i=pointNumberOne:pointNumberTwo
    point_x_left(i)=p1_x_left+(p2_x_left-p1_x_left)*(i-pointNumberOne)/numberOfEyesInOneInterval;
end
for i=(pointNumberTwo+1):pointNumberThree
    point_x_left(i)=p2_x_left+(p3_x_left-p2_x_left)*(i-pointNumberTwo)/numberOfEyesInOneInterval;
end
for i=(pointNumberThree+1):pointNumberFour
    point_x_left(i)=p3_x_left+(p4_x_left-p3_x_left)*(i-pointNumberThree)/numberOfEyesInOneInterval;
end
for i=(pointNumberFour+1):numberOfHalfEyes
    point_x_left(i)=p4_x_left+(p1_x_left-p4_x_left)*(i-pointNumberFour)/numberOfEyesInOneInterval;
end

a_left=p2_x_left;
b_left=k2-p1_y_left;
for i=1:pointNumberTwo
    point_y_left(i)=-1*sqrt((1-point_x_left(i).^2/a_left.^2)*b_left.^2)+sqrt(3)/4;
end
for i=(pointNumberTwo+1):pointNumberFour
    point_y_left(i)=sqrt((1-point_x_left(i).^2/a_left.^2)*b_left.^2)+sqrt(3)/4;
end
for i=(pointNumberFour+1):numberOfHalfEyes
    point_y_left(i)=-1*sqrt((1-point_x_left(i).^2/a_left.^2)*b_left.^2)+sqrt(3)/4;
end

% %plot
% for ii=1:12
%     plot(point_x_left(ii),point_y_left(ii),'r.','MarkerSize',30);
%     hold on;
% end