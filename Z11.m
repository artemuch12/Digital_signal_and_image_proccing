% ÃŒƒ≈À»–Œ¬¿Õ»≈ À»Õ≈…Õ€’ »— ¿∆≈Õ»… »«Œ¡–¿∆≈Õ»…
% MODELING LINEAR IMAGE DISTORTIONS

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

KCHX5 = impulseResponce(5, nRow, nCol);
KCHX10 = impulseResponce(10, nRow, nCol);
KCHX20 = impulseResponce(20, nRow, nCol);

figure;
subplot(2,2,1);
imshow(ifftshift(KCHX5), []);
title("Impulse responce from 5");
subplot(2,2,2);
imshow(ifftshift(KCHX10), []);
title("Impulse responce from 10");
subplot(2,2,3);
imshow(ifftshift(KCHX20), []);
title("Impulse responce from 20");

figure;
subplot(2,2,1);
imshow(KCHX5, []);
title("KCHX from 5");
subplot(2,2,2);
imshow(KCHX10, []);
title("KCHX 10");
subplot(2,2,3);
imshow(KCHX20, []);
title("KCHX 20");

rasImage5 = rasfokus(image, 5);
rasImage10 = rasfokus(image, 10);
rasImage20 = rasfokus(image, 20);

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

save('rasImage.mat', 'rasImage5', 'rasImage10', 'rasImage20');

rmpath('.\image');
rmpath('.\function');