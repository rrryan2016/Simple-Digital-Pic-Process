clear all;
clc;

myPic = imread('exp.jpg');
myPic_gray = rgb2gray(myPic);
% imwrite(myPic_gray,'myPic_gray.jpg');
myPic = im2double(myPic_gray);

[height,width]  = size(myPic);
subplot(1,4,1);
imshow((myPic));
title('Original Pic');

%Do Motion Change
Len  = 210;
% A camera with len pixels moves to generate / default = 9
% in the direction of theta, the image moves len pixels
Theta = 110; %  / default = 0
PSF = fspecial  ('motion',Len,Theta);
myPic_blurred = imfilter (myPic,PSF,'conv','circular');
subplot(1,4,2);
imshow(myPic_blurred);
title('Blurred Pic');

% Deblur / Filtering Method 1: Inverse Filter
myPic_blurred_f = fft2(myPic_blurred);
PSF_f = fft2(PSF,height,width);
deblurred_myPic = ifft2(myPic_blurred_f./PSF_f);
subplot(1,4,3);
imshow(deblurred_myPic);
title('Inverse-DeBlurred myPic');

% Deblur / Filtering Method 2: regularized filter
fr = deconvreg(myPic_blurred,PSF);
subplot(1,4,4);
imshow(fr);
title('Regularized-DeBlurred myPic');