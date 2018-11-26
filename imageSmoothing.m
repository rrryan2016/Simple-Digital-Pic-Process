main.m
clear all;
clc;

image = imread('exp1.jpg');
image = rgb2gray(image);
filter = zeros(20,20);
filter = filter +1;
filter = filter / 400;
% filter = 1/9 * [1 1 1;1 1 1 ; 1 1 1];
myAverage(image,filter)

myAverage.m
function [outImage] = myAverage(inImage,inFilter)
tempImage = double(inImage)/255;
outImage = conv2(double(tempImage),double(inFilter),'same');
imshow(outImage);
end