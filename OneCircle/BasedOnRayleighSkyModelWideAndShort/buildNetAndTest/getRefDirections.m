function [refDirections]=getRefDirections(numberOfEles,NumberOfTs)

numberOfElesMultiT=numberOfEles*NumberOfTs;
refDirections=zeros(1,numberOfElesMultiT*360);

refOne=1:360;
for i=1:NumberOfTs*numberOfEles   
    refDirections(:,1+360*(i-1):360*i)=refOne;
end