% Ã≈ƒ»¿ÕÕ¿ﬂ ‘»À‹“–¿÷»ﬂ »«Œ¡–¿∆≈Õ»…
% MEDIAN FILTERING OF IMAGES

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = imread('len.bmp');
[nRow, nCol, nColor] = size(image);
figure;
imshow(image);
title("Original Image Face");

harLocalMed = 1/9*[[1 1 1]
                   [1 1 1]
                   [1 1 1]];

impImage = impNoise(image, 10);
figure;
imshow(impImage);
title("Image with noise");

localMedStandart = conv2(harLocalMed, impImage);
figure;
imshow(localMedStandart, []);
title("Linear filter");

medImage = medianFilter(impImage, 3);
figure;
imshow(medImage);
title("Image with median filter");

medImageMatLAB = medfilt2(impImage);
figure;
imshow(medImageMatLAB);
title("Image with standert median filter");

rmpath('.\image');
rmpath('.\function');
