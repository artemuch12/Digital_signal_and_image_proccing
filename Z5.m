%  ¬¿Õ“Œ¬¿Õ»≈ »«Œ¡–¿∆≈Õ»…
% QUANTIZATION OF IMAGES

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = imread('face512.bmp');
[nRow, nCol, nColor] = size(image);
figure;
imshow(image);
title('Original Image');
Ra = [[40 60 150 90 10]
    [80 170 240 200 110]
    [140 210 250 220 130]
    [120 190 230 180 70]
    [20 100 160 50 30]];

imageQuan12 = imageQuantization(image, 12);

imageNoise = addNoise(image, 12);
figure;
imshow(imageNoise);
title('Image with noise');
imageNoiseAndQuan12 = imageQuantization(imageNoise, 12);
figure;
subplot(1,2,1);
imshow(imageQuan12);
title('Quantization image to 12 levels');
subplot(1,2,2);
imshow(imageNoiseAndQuan12);
title('Image with noise and quantization to 12 levels');

rastImage = rasterImage(image, Ra);
[rastAndContrastImage,~] = linContrast(rastImage);
binImageOrigin = binImage(image, 127);
binImage = binImage(rastAndContrastImage, 250);
figure;
subplot(1,2,1);
imshow(binImageOrigin);
title('Logical origin image');
subplot(1,2,2);
imshow(binImage);
title('Logical raster image');

rmpath('.\image');
rmpath('.\function');