clear all;
clc;

inImage = imread('exp.jpg');
inImage = rgb2gray(inImage);

[height,width] = size(inImage);
tempImage = inImage;

% Get the original hist
inHist = zeros(1,256);
for i = 1:height
    for j = 1:width
        inHist(tempImage(i,j)+1)=inHist(tempImage(i,j)+1)+1; % the gary degree ranges from 0 to 255, but the index in matlab starts from 1, so '+1' in the code. 因为灰度值得分布是0-255，而索引只能从1开始
    end
end

% Accumulated
CDF = zeros(1,256);
CDF(1) = inHist(1);
for i = 2:256
    CDF(i) = inHist(i)+CDF(i-1);
end

% Calculate the new gray degree
for i=1:256
    % GLT(i) = floor(CDF(i)*256)+1;
    GLT(i) = floor(CDF(i)/(height*width)*255)+1; % It is no strict in  floor() + 1, you can change it to fix() round() ceil() or whatever  这个floor()+1没有影响，只要大概是一个取整函数就可以了
end
GLT(256) = 256;

% Re-count from the scratch and get the new hist and new image
outHist = zeros(1,256);
outImage = zeros(height,width);

for i =1:height
    for j = 1:width
        outImage(i,j) = GLT(tempImage(i,j)+1)-1;
        outHist(outImage(i,j)+1)=outHist(outImage(i,j)+1)+1;
    end
end

outImage = uint8(outImage);

% Presentation 
figure
subplot(2,2,1);
imshow(outImage);
title('outImage');
subplot(2,2,3);
stairs(outHist);
title('outHist');
subplot(2,2,2);
imshow(inImage);
title('inImage');
subplot(2,2,4);
stairs(inHist);
title('inHist');