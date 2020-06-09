
% % 3
% f = imread('Img/Fig1121(a)(random_matches).tif');
f = imread('Img/Fig0403(a)(image).tif');

F = fft2(f);
Fc = fftshift(F);
S= log(1+abs(Fc));
ff = real(ifft2(F));

figure,
subplot(1,3,1)
imshow(f, [ ] )
title('Orginal Pic')
subplot(1,3,2)
imshow(S, [ ])
title('FFT shift after Log')
subplot(1,3,3)
imshow(f, [ ])
title('inverse transformation')
