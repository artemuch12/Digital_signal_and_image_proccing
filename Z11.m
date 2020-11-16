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

impulse5 = impulseResponce(5, nRow, nCol);
impulse10 = impulseResponce(10, nRow, nCol);
impulse20 = impulseResponce(20, nRow, nCol);

figure;
subplot(2,2,1);
imshow(impulse5, []);
title("Impulse responce from 5");
subplot(2,2,2);
imshow(impulse10, []);
title("Impulse responce from 10");
subplot(2,2,3);
imshow(impulse20, []);
title("Impulse responce from 20");

figure;
subplot(2,2,1);
imshow(log(amplitudeSpectr(impulse5)+1), []);
title("Impulse responce from 5");
subplot(2,2,2);
imshow(log(amplitudeSpectr(impulse10)+1), []);
title("Impulse responce from 10");
subplot(2,2,3);
imshow(log(amplitudeSpectr(impulse20)+1), []);
title("Impulse responce from 20");

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

imwrite(rasImage5, 'rasImage5.bmp');
imwrite(rasImage10, 'rasImage10.bmp');
imwrite(rasImage20, 'rasImage20.bmp');

rmpath('.\image');
rmpath('.\function');