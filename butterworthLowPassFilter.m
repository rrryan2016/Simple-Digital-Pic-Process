clear all;
clc;

% Read the original pic, and process it into the form of gray and double
myPic = imread('exp.jpg');
[height,width,nDims] = size(myPic);
myPic_gray = rgb2gray(myPic);
myPic_gray = double(myPic_gray)/255;

subplot(2,4,1);
imshow(myPic_gray);
title('Original Gray');

% Add 5dBm Gaussian White Noise in the original pic
sprintf('Adding noise ... ')
noise = wgn(height,width,5);% Generate 25dBm Gaussian white noise
myPic_noise = myPic_gray+noise;
subplot(2,4,2);
imshow(myPic_noise);
title('Noise Pic');
sprintf('Noise Pic Generated')

% Do fourier transfer
myPic_f = fft2(myPic_noise);
myPic_f = fftshift (myPic_f);
[fre_height,fre_width]= size(myPic_f);

subplot(2,4,3);
imshow(myPic_f);
title('Amplitude of Noise Pic in Frequency Domain');

% Butterworth Filter in 20
nn = 2 ; %Means the Butterworth low pass filter is 2 terms
d0 = 20; % And the cut-off Frequency is 20
m = fix(fre_height/2);
n = fix(fre_width/2);% The round function
for i = 1:fre_height
    for j =1 :fre_width
        d = sqrt((i-m)^2+(j-n)^2);
        h = 1/(1+0.414*(d/d0)^(2*nn));
        result(i,j) = h*myPic_f(i,j);
    end
end

imwrite(result, 'amplitude20.jpg')
subplot(2,4,6);
imshow(result);
title('Amplitude of 20 in Frequency Domain');

result = ifftshift(result);
myPic_process = ifft2(result);
imwrite(myPic_process,'myPicFreqFiltered20.jpg')
subplot(2,4,5);
imshow(myPic_process);
title('Cut-off Frequency = 20');

% Butterworth Filter in 50
nn = 2 ; %Means the Butterworth low pass filter is 2 terms
d0 = 50; % And the cut-off Frequency is 50
m = fix(fre_height/2);
n = fix(fre_width/2);% The round function
for i = 1:fre_height
    for j =1 :fre_width
        d = sqrt((i-m)^2+(j-n)^2);
        h = 1/(1+0.414*(d/d0)^(2*nn));
        result(i,j) = h*myPic_f(i,j);
    end
end

imwrite(result, 'amplitude50.jpg');
subplot(2,4,8);
imshow(result);
title('Amplitude of 50 in Frequency Domain');

result = ifftshift(result);
myPic_process = ifft2(result);
imwrite(myPic_process,'myPicFreqFiltered50.jpg')
subplot(2,4,7);
imshow(myPic_process);
title('Cut-off Frequency = 50');