function [ LBP] = LBP( I)
m=size(I,1);
n=size(I,2);
for i=2:m-1
    for j=2:n-1
        count = 0;
        J0=I(i,j);
        temp(i-1,j-1)=I(i-1,j-1)>J0;
        temp(i,j-1)=I(i,j-1)>J0;
        temp(i+1,j-1)=I(i+1,j-1)>J0;       
        temp(i+1,j)=I(i+1,j)>J0; 
        temp(i+1,j+1)=I(i+1,j+1)>J0; 
        temp(i,j+1)=I(i,j+1)>J0;
        temp(i-1,j+1)=I(i-1,j+1)>J0; 
        temp(i-1,j)=I(i-1,j)>J0;
        LBP(i,j)=temp(i-1,j-1)*2^7+temp(i,j-1)*2^6+temp(i+1,j-1)*2^5+temp(i+1,j)*2^4+temp(i+1,j+1)*2^3+temp(i,j+1)*2^2+temp(i-1,j+1)*2^1+temp(i-1,j)*2^0;
    end
end
end