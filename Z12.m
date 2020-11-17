% ¬Œ——“¿ÕŒ¬À≈Õ»≈ À»Õ≈…ÕŒ-»— ¿∆≈ÕÕ€’ »«Œ¡–¿∆≈Õ»… »Õ¬≈–—Õ€Ã ‘»À‹“–ŒÃ
% RESTORING LINEARLY DISTORTED IMAGES WITH AN INVERSE FILTER

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = double(imread('len.bmp'));
[nRow, nCol, nColor] = size(image);
figure;
imshow(image,[]);
title("Original Image Face");

load('rasImage.mat', 'rasImage5', 'rasImage10', 'rasImage20')

figure;
subplot(2,2,1);
imshow(rasImage5, []);
title("Distortions from 5");
subplot(2,2,2);
imshow(rasImage10, []);
title("Distortions from 10");
subplot(2,2,3);
imshow(rasImage20, []);
title("Distortions from 20");

resImage5 = restoringImage(rasImage5, 5);
resImage10 = restoringImage(rasImage10, 10);
resImage20 = restoringImage(rasImage20, 20);

figure;
subplot(2,2,1);
imshow(resImage5, []);
title("Distortions from 5");
subplot(2,2,2);
imshow(resImage10, []);
title("Distortions from 10");
subplot(2,2,3);
imshow(resImage20, []);
title("Distortions from 20");

rasImage5destrHor = rasImage5;
rasImage5destrHor(1,:) = 0;

resImage5destrHor = restoringImage(rasImage5destrHor, 5);
figure;
imshow(resImage5destrHor, []);

rasImage5destrVer = rasImage5;
rasImage5destrVer(:,1) = 0;

resImage5destrVer = restoringImage(rasImage5destrVer, 5);
figure;
imshow(resImage5destrVer, []);

rasImage5destrVer = rasImage5;
rasImage5destrVer(:,1) = 0;

rasImage5destrHV = rasImage5;
rasImage5destrHV(:,1) = 0;
rasImage5destrHV(1,:) = 0;
resImage5destrHV = restoringImage(rasImage5destrHV, 5);
figure;
imshow(resImage5destrHV, []);

rmpath('.\image');
rmpath('.\function');