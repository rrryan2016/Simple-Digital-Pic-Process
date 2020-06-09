clear all;
clc;

I = imread('BABOO.bmp');
% I = imread('Lena.bmp');
% I = imread('Fig0316(a)(moon).tif');
disp('Start')
disp('Calculating...')
LBP = LBP(I);
LBP_equivalent = LBP_equivalent(I);
LBP_rotation_invariant = LBP_rotation_invariant(I);
disp('Calculation Completed')
disp('Displaying...')
% imshow(LBP)
figure,
subplot(2,2,1)
imshow(I)
title('Orginal')
subplot(2,2,2)
imshow(LBP)
title('LBP')
subplot(2,2,3)
imshow(LBP)
title('LBP_equivalent')
subplot(2,2,4)
imshow(LBP_rotation_invariant)
title('LBP_rotation_invariant')
disp('Displayed')





