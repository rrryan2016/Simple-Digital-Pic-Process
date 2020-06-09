clc
run('C:\Personal\Study\研究生课程\媒体计算\实验二\vlfeat\vlfeat-0.9.21\toolbox\vl_setup.m')
disp('Start')

% SIFT Extraction
% Extracting frames and descriptors 
I = imread('robster_1.jpeg');
I = single(rgb2gray(I));
figure,
subplot(1,2,2)
imshow(I, [] )
disp('imshow completed')
[f,d] = vl_sift(I);

% random selection of features 
perm = randperm(size(f,2)) ;
sel = perm(1:80) ;
h1 = vl_plotframe(f(:,sel)) ;
h2 = vl_plotframe(f(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;
h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
set(h3,'color','g') ;

subplot(1,2,1)
imshow(I,[])

% % SIFT Matching & Comparison 
% % Matching 
% disp('Reading Images...')
% Ia = imread('robster_1.jpeg');
% Ib = imread('robster_2.jpeg');
% Ia = single(rgb2gray(Ia));
% Ib = single(rgb2gray(Ib));
% disp('Showing Images...')
% disp('Sifting...')
% [fa, da] = vl_sift(Ia);
% [fb, db] = vl_sift(Ib);
% 
% disp('Matching...')
% [matches,scores] = vl_ubcmatch(da,db);
% 
% [~, matchid] = sort(scores); % ascending sequence
% 
% matchid = matchid(1, 10:end);
% matches = matches(:, matchid);
% bestMatches = matches;
% 
% pSrc = fa(1:2, bestMatches(1, :));% these are matches.
% pTgt = fb(1:2, bestMatches(2, :));
% 
% combs = [1 2 3 4]; % Use top 4 matches.
% bestMatchesID = 1;
% 
% A = zeros(8, 9); 
% for i=1:4
% xi = pSrc(1, combs(bestMatchesID, i));
% yi = pSrc(2, combs(bestMatchesID, i));
% xiprime = pTgt(1, combs(bestMatchesID, i));
% yiprime = pTgt(2, combs(bestMatchesID, i));
% 
% row1 = [xi yi 1 0 0 0 -(xiprime*xi) -(xiprime*yi) -xiprime];
% row2 = [0 0 0 xi yi 1 -(yiprime*xi) -(yiprime*yi) -yiprime];
% A((2*i-1):(2*i), :) = [row1; row2];
% end
% 
% [V,D] = eig(A'*A);
% h = reshape(V(:, 1), 3, 3);
% 
% X_hom=h'*[pSrc;ones(1,size(pSrc, 2))];  
% X_hom=X_hom./repmat(X_hom(3,:),[3,1]);
% match_plot(Ia, Ib, pSrc', X_hom');
% 
% disp('Finished!')
% % 
% % disp('imshow completed')
% % [f,d] = vl_sift(I);
