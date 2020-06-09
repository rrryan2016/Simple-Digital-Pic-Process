clear all 


%% 1.1
i = imread('Img/Fig0316(a)(moon).tif');
% g = imadjust(i,[0.2 0.8],[0.4 0.6],1);
g = imadjust(i,[0 1],[1 0],1);
figure,
subplot(1,2,1)
imshow(i)
subplot(1,2,2)
imshow(g)
% 
% % 1.2
% i = imread('ImgSample/BABOO.bmp');
i = imread('Img/Fig0615(a)(Aerial Original).tif.tif');

h = imhist(i,256);
h1 = h(1:5:256);
horz = 1:5:256;

g=histeq(i,256);

e = imhist(g,256);
e1 = e(1:5:256);
eorz = 1:5:256;

figure,
subplot(2,2,1)
imshow(i)
title('Original Pic')

subplot(2,2,2)
% imshow(h)
stem(horz,h1,'fill');
axis([0 255 0 15000])
set(gca,'xtick',[0:50:255])
set(gca,'ytick',[0:2000:15000])
title('imhist()')

subplot(2,2,3)
imshow(g)
title('histeq()')

subplot(2,2,4)
stem(eorz,e1,'fill');
axis([0 255 0 15000])
set(gca,'xtick',[0:50:255])
set(gca,'ytick',[0:2000:15000])
title('imhist() after')



