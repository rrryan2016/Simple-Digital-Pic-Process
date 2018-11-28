clear all;
clc;

image = imread('exp.jpg');
image = rgb2gray(image);
image_ = imnoise(image,'salt & pepper',0.02); % Add salt & pepper noises
% figure
% imshow(image_);
image__ = medfilt2(image_,[3 3]); % do median filtering
figure
subplot(1,3,1);
imshow(image);
title('image');
subplot(1,3,2);
imshow(image_);
title('noise');
subplot(1,3,3);
imshow(image__);
title('Back');
