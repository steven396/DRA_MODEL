% function trainNet()
minT=2;
maxT=10;
numberOfEles=50;
[resp_1_90,resp_11_70,resp_21_70]=sortData(minT,maxT);
numberOfTs=maxT-minT;%should be maxT-minT+1, but values of T=2 were deleted 

ref=getRefDirections(numberOfEles,numberOfTs);
A=resp_21_70;
B=A';
net=feedforwardnet([3,16]);
net=train(net,B,ref);