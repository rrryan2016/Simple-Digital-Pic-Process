clear all;
clc;
% The example is using Sobel or Robert
sobel_h = [-1 -2 -1 ; 0 0 0 ; 1 2 1 ];
sobel_v = [-1 0 1; -2 0 2; -1 0 1];

% Robert1 = [1 0; 0 -1];
% Robert2 = Robert1';

image = imread('exp.jpg');
image = rgb2gray(image);
myEdge(image,sobel_v,sobel_h);

%% Put the code below into a extra new file, and name it myEdge.m to run the code above. 

function [outImage] = myEdge(inImage,inOperator1,inOperator2)
tempImage = double(inImage)/255;
t1 = conv2(double(tempImage),double(inOperator1),'same');
t2 = conv2(double(tempImage),double(inOperator2),'same');
outImage = abs(t1)+abs(t2);
outImage = (outImage-min(outImage(:)))/(max(outImage(:))-min(outImage(:)));
imshow(outImage);
end