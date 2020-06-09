
% % 2.1
i = imread('ImgSample/BABOO.bmp');
j1 = imnoise(i,'gaussian');
j2 = imnoise(i,'salt & pepper');
j3 = imnoise(i,'speckle');

% Compare different noises 
figure,
subplot(1,4,1)
imshow(i)
title('Orginal Pic')
subplot(1,4,2)
imshow(j1)
title('gaussian')
subplot(1,4,3)
imshow(j2)
title('salt & pepper')
subplot(1,4,4)
imshow(j3)
title('speckle')

% Compare different filter
w = fspecial('average',3);
g1 = imfilter(j1,w,'conv','replicate','same');
g2 = medfilt2(j1,[3 3]);
figure,
subplot(2,2,1)
imshow(i)
title('Original Pic')
subplot(2,2,2)
imshow(j1)
title('Gaussian Noise')
subplot(2,2,3)
imshow(g1)
title('imfilter with 3x3 conv')
subplot(2,2,4)
imshow(g2)
title('medfilter with 3x3')

% % 2.2
i = imread('Img/Fig0318(a)(ckt-board-orig).tif');
w1 = fspecial('prewitt');
w2 = fspecial('sobel');
w3 = fspecial('laplacian',0.5);

g1 = imfilter(i,w1,'conv','replicate','same');
g2 = imfilter(i,w2,'conv','replicate','same');
g3 = imfilter(i,w3,'conv','replicate','same');

figure,
subplot(1,4,1)
imshow(i)
title('Orginal Pic')

subplot(1,4,2)
imshow(g1)
title('prewitt')

subplot(1,4,3)
imshow(g2)
title('sobel')

subplot(1,4,4)
imshow(g3)
title('laplacian')
