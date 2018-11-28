clear all;
clc;

myPic = imread('exp.jpg');
% [height,width] = size(myPic);
myPic_gray = rgb2gray(myPic);
% myPic_gray = double(myPic_gray)/255;

subplot(1,3,1);
imshow(myPic_gray);
title('Original Gray');

% Do preparation
myPic_f = fftshift(fft2(myPic_gray));
[height,width] = size(myPic_f);
%height0 = round(height/2);
%width0 = round(width/2);
height0 = floor(height/2);
width0 = floor(width/2);

% Ideal Low Pass Filter (ILPF) Process
myPic_process_ILPF = myPic_f;
d_ILPF = 10; % Cut-off
for i = 1:height
    for j = 1:width
        distance_ILPF = sqrt((i-height0)^2+(j-width0)^2);
        if distance_ILPF<=d_ILPF h=1;
        else h=0;
        end
        myPic_process_ILPF(i,j)= h*myPic_f(i,j);
    end
end
% Show and save ILPF result
myPic_process_ILPF = uint8(real(ifft2(ifftshift(myPic_process_ILPF))));
imwrite (myPic_process_ILPF,'myPicAfterILPF.jpg');
subplot(1,3,2);
imshow(myPic_process_ILPF);
title('Pic After ILPF');

% gaussian process
d_gaussian = 10; % Cut off frequency
n = 2; %Give n a initial value  
myPic_process_gaussian = myPic_f;
for i =1:height
    for j = 1:width
        distance_gaussian = sqrt((i-height0)^2+(j-width0)^2);
        h = 1*exp(-1/2*(distance_gaussian^2)/(d_gaussian^2));
        myPic_process_gaussian(i,j) = h*myPic_f(i,j);
    end
end
% Show and save gaussian result
myPic_process_gaussian = uint8(real(ifft2(ifftshift(myPic_process_gaussian))));
imwrite(myPic_process_gaussian,'myPicAfterGaussian.jpg');
subplot(1,3,3);
imshow(myPic_process_gaussian);
title('After Gaussian');