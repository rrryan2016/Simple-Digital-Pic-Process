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
        v1 = list(1)*2^7+list(2)*2^6+list(3)*2^5+list(4)*2^4+list(5)*2^3+list(6)*2^2+list(7)*2^1+list(8)*2^0;
        v2 = list(1)*2^0+list(2)*2^7+list(3)*2^6+list(4)*2^5+list(5)*2^4+list(6)*2^3+list(7)*2^2+list(8)*2^1;
        v3 = list(1)*2^1+list(2)*2^0+list(3)*2^7+list(4)*2^6+list(5)*2^5+list(6)*2^4+list(7)*2^3+list(8)*2^2;
        v4 = list(1)*2^2+list(2)*2^1+list(3)*2^0+list(4)*2^7+list(5)*2^6+list(6)*2^5+list(7)*2^4+list(8)*2^3;
        v5 = list(1)*2^3+list(2)*2^2+list(3)*2^1+list(4)*2^0+list(5)*2^7+list(6)*2^6+list(7)*2^5+list(8)*2^4;
        v6 = list(1)*2^4+list(2)*2^3+list(3)*2^2+list(4)*2^1+list(5)*2^0+list(6)*2^7+list(7)*2^6+list(8)*2^5;
        v7 = list(1)*2^5+list(2)*2^4+list(3)*2^3+list(4)*2^2+list(5)*2^1+list(6)*2^0+list(7)*2^7+list(8)*2^6;
        v8 = list(1)*2^6+list(2)*2^5+list(3)*2^4+list(4)*2^3+list(5)*2^2+list(6)*2^1+list(7)*2^0+list(8)*2^7;
        v_list = [v1, v2, v3,v4 ,v5,v6,v7,v8];
        least = v1;
        for k = 2:8 
            if v_list(k) < least
                least = v_list(k) ;

        LBP_equivalent (i,j)=least;
            end
        end
end
end

% function [LBP_rotation_invariant] = LBP_rotation_invariant (I)
% m=size(I,1);
% n=size(I,2);
% for i=2:m-1
%     for j=2:n-1
%         neighbor = [I(i-1,j-1) I(i,j-1) I(i+1,j-1) I(i+1,j) I(i+1,j+1) I(i,j+1) I(i-1,j+1) I(i-1,j)] ;
%         pixel = 0;
%         for k = 1:8
%             pixel = pixel + neighbor(1,k) * bitshift(1,8-k);
%         end
%         LBP_rotation_invariant = uint8(rotationMin(pixel));
%     end
% end
% end
% 
% function minval = rotationMin(i)
% disp('Finding the minimum ...')
% i = uint8(i);
% vals = ones([1 8])*256;
% for k=1:8
%     vals(k) = i;
%     last_bit = mod(i,2);
%     i = bitshift(i,-1);
%     i = last_bit * 128 + i;
% end
% minval = min(vals);
% end 
% 
