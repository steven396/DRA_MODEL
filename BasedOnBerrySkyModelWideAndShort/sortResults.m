y=net(B);
ddd=zeros(50*6,360);
for i=1:50*6
    k1=360*(i-1)+1;
    k2=360*i;
    ddd(i,:)=y(k1:k2);
end