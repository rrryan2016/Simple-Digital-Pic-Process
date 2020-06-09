
% % 4 
clc;
f = imread('Img/Fig0405(a)(square_original).tif');

% Frequency domain
F = fft2(f);
H = lpfilter('gaussian',256,256,10);
G = H.*F;
g1 = real(ifft2(G));


% spatial domain
w = fspecial('gaussian',[200 200]);
g2 = imfilter(f,w,'conv','replicate','same');

figure,
subplot(1,3,1)
imshow(f)
title('Original Pic')
subplot(1,3,2)
imshow(g1)
title('frequency domain filtering')
subplot(1,3,3)
imshow(g2)
title('spatial domain filtering')