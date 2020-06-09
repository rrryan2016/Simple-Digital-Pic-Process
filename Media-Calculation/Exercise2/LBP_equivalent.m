function [ LBP_equivalent  ] = LBP_equivalent(I)
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
        
        list = [temp(i-1,j-1),temp(i,j-1),temp(i+1,j-1),temp(i+1,j),temp(i+1,j+1),temp(i,j+1),temp(i-1,j+1),temp(i-1,j)];
        for k = 1:7
            if list(k) ~= list(k+1)
                count = count + 1;
            end
        end
        LBP_equivalent (i,j)=count / 7 * 256 ;
    end
end
end