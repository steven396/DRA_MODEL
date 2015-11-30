function [resp_1_90,resp_11_70,resp_21_70]=sortData(minT,maxT)
% minT=3;
% maxT=10;
load('/Users/wangxin/Desktop/responseRotated-36-360-90.mat');
interval=32400;

resp_1_90=responseRotated;
for i=minT:maxT
    n=i;
    eval(['T',num2str(i),'=responseRotated(1+n*interval:interval*(n+1),:);']);
end
resp_11_70=[];
for j=minT:maxT
    eval(['T',num2str(j),'_11_70=T',num2str(j),'(3601:25200,:);']);
    eval(['resp_11_70=[resp_11_70;T',num2str(j),'_11_70];']);
end
resp_21_70=[];
for k=minT:maxT
    eval(['T',num2str(k),'_21_70=T',num2str(k),'(7201:25200,:);']);
    eval(['resp_21_70=[resp_21_70;T',num2str(k),'_21_70];']);
end

