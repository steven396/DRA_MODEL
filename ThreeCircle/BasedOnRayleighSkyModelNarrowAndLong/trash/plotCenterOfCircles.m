[point_x_left,point_y_left]=CalculateCenterOfCirclesInLeftEye(36)
[point_x_right,point_y_right]=CalculateCenterOfCirclesInRightEye(36)
plot(point_x_right,point_y_right,'k.','MarkerSize',10);
hold on;
plot(point_x_left,point_y_left,'k.','MarkerSize',10);
axis([-1,1,-1,1]);