clear all;
clc;
exp = imread('exp.jpg');
exp_gray = rgb2gray(exp);
% vectorial
sobel_v = [-1 0 1;-2 0 2; -1 0 1];
% horizatal
sobel_h = sobel_v';

response_v =  conv2(exp_gray,sobel_v,'valid');
response_h =  conv2(exp_gray,sobel_h,'valid');
response =  sqrt(response_h.^2+response_v.^2);

response_min = min(response(:));
response_max = max(response(:));
response =  (response-response_min)/response_max;

exp_edge = response>0.25;

subplot(1,4,1);
imshow(exp_edge);
title('Edge Pic');

% Hough Process
[height,width] = size(exp_edge);
H =  zeros(361,ceil(sqrt(height^2+width^2))+1);
for i = 1:height
    for j = 1:width
        if exp_edge(i,j) == 1
            for k = 0:360
                r = i*cos(k*pi/180) +  j*sin(k*pi/180);
                if round(r)>0
                    H(k+1,round(r))  = H(k+1,round(r))+1;
                end
            end
        end
    end
end
subplot(1,4,2);
imshow(H);
title('Hough Pic');

[theta,r] = find(H ==  max(H(:)),1,'first');% Find the point with most votes, and set the line in the original picture in red(please find the red line after zooming-in with carefulness).
for i = 1:height
    j =  (r-i*cos((theta-1)*pi/180))/sin((theta-1)*pi/180);
    j = round(j);
    if j > 0 && j<width
        exp(i,j,1) = 255;
        exp(i,j,2) = 0;
        exp(i,j,3) = 0 ;
    end
end
subplot(1,4,3);
imshow(exp);
title('Final Pic (with line)');
imwrite(exp,'Final Pic (With  Lines).jpg');
% imshow(exp);