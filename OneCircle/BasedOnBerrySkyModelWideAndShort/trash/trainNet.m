% function trainNet()
minT=4;
maxT=4;
numberOfEles=50;
[resp_1_90,resp_11_70,resp_21_70]=sortData(minT,maxT);
numberOfTs=maxT-minT+1;
ref=getRefDirections(numberOfEles,numberOfTs);
A=resp_21_70;
B=A';
net=feedforwardnet([3,16]);
net.trainParam.epochs = 50000;
net=train(net,B,ref);