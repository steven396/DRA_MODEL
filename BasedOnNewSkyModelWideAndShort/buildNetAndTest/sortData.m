function [resp_1_90,resp_11_70,resp_21_70]=sortData(minT,maxT)
% minT=2;
% maxT=8;
% load('/Users/wangxin/Desktop/compound eyes simulation_20151123_lab/data/responseRotated-36-360-90.mat')
load('/Users/wangxin/Desktop/responseRotated-36-360-90.mat');
interval=32400;

resp_1_90=response_withIntensity;
for i=minT:maxT
    n=i-2;
    eval(['T',num2str(i),'=response_withIntensity(1+n*interval:interval*(n+1),:);']);
end
resp_11_70=[];
for j=minT+1:maxT
    %avoid degree over 1 when T=2
    eval(['T',num2str(j),'_11_70=T',num2str(j),'(3601:25200,:);']);
    eval(['resp_11_70=[resp_11_70;T',num2str(j),'_11_70];']);
end
resp_21_70=[];
for k=minT+1:maxT
    %avoid degree over 1 when T=2
    eval(['T',num2str(k),'_21_70=T',num2str(k),'(7201:25200,:);']);
    eval(['resp_21_70=[resp_21_70;T',num2str(k),'_21_70];']);
end
