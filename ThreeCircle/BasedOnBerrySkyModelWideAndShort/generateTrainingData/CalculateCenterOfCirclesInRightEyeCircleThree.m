function [point_x_right,point_y_right]=CalculateCenterOfCirclesInRightEyeCircleThree(numberOfHalfEyes)
k1 = 1/2;
k2 = sqrt(3)/4;
rate = 1/3;

extraInside_1=k1*2*rate*rate*2;
extraInside_2=k2*2*rate*rate*2;

p1_x_right=0;
p1_y_right=-1*k2*rate-extraInside_2;
p2_x_right=k1*(1-rate)-extraInside_1;
p2_y_right=-1*k2;
p3_x_right=0;
p3_y_right=-1*(k2+2*k2*rate)+extraInside_2;
p4_x_right=-1*p2_x_right;
p4_y_right=p2_y_right;

point_x_right=zeros(1,numberOfHalfEyes);
point_y_right=zeros(1,numberOfHalfEyes);

numberOfEyesInOneInterval=numberOfHalfEyes/4;
pointNumberOne=1;
pointNumberTwo=pointNumberOne+numberOfEyesInOneInterval;
pointNumberThree=pointNumberTwo+numberOfEyesInOneInterval;
pointNumberFour=pointNumberThree+numberOfEyesInOneInterval;

for i=pointNumberOne:pointNumberTwo
    point_x_right(i)=p1_x_right+(p2_x_right-p1_x_right)*(i-pointNumberOne)/numberOfEyesInOneInterval;
end
for i=(pointNumberTwo+1):pointNumberThree
    point_x_right(i)=p2_x_right+(p3_x_right-p2_x_right)*(i-pointNumberTwo)/numberOfEyesInOneInterval;
end
for i=(pointNumberThree+1):pointNumberFour
    point_x_right(i)=p3_x_right+(p4_x_right-p3_x_right)*(i-pointNumberThree)/numberOfEyesInOneInterval;
end
for i=(pointNumberFour+1):numberOfHalfEyes
    point_x_right(i)=p4_x_right+(p1_x_right-p4_x_right)*(i-pointNumberFour)/numberOfEyesInOneInterval;
end

a_right=p2_x_right;
b_right=k2-(-1)*p1_y_right;

for i=1:pointNumberTwo
    point_y_right(i)=sqrt((1-point_x_right(i).^2/a_right.^2)*b_right.^2)-sqrt(3)/4;
end
for i=(pointNumberTwo+1):pointNumberFour
    point_y_right(i)=-1*sqrt((1-point_x_right(i).^2/a_right.^2)*b_right.^2)-sqrt(3)/4;
end
for i=(pointNumberFour+1):numberOfHalfEyes
    point_y_right(i)=sqrt((1-point_x_right(i).^2/a_right.^2)*b_right.^2)-sqrt(3)/4;
end

%%plot
% for ii=1:12
%     plot(point_x_right(ii),point_y_right(ii),'r.','MarkerSize',30);
%     hold on;
% end