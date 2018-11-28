clear all;
clc;

image = imread('exp.jpg');
image = rgb2gray(image);

% Build the filter 
filter = zeros(20,20);
filter = filter +1;
filter = filter / 400;

myAverage(image,filter)


%% Put the code below into a extra new file, and name it myAverage.m to run the code above. 

function [outImage] = myAverage(inImage,inFilter)
tempImage = double(inImage)/255;
outImage = conv2(double(tempImage),double(inFilter),'same');
imshow(outImage);
end