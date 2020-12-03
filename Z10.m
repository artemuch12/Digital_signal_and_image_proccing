% МЕДИАННАЯ ФИЛЬТРАЦИЯ ИЗОБРАЖЕНИЙ
% MEDIAN FILTERING OF IMAGES

clear
close all
clc

addpath('.\image');
addpath('.\function');

% Загрузка исходного изображения
image = imread('len.bmp');
[nRow, nCol, nColor] = size(image);
figure;
imshow(image);
title("Original Image Face");

% Маска для расчета локального среднего
harLocalMed = 1/9*[[1 1 1]
                   [1 1 1]
                   [1 1 1]];

% Зашумление изображения импульсным шумом с вероятностью 5%
impImage = impNoise(image, 5);
figure;
imshow(impImage);
title("Image with noise");

% Сглаживание искаженного изображения
localMedStandart = conv2(harLocalMed, impImage);
figure;
imshow(localMedStandart, []);
title("Linear filter");

% Медианная фильтрация собственной функцией
medImage = medianFilter(impImage, 3);
figure;
imshow(medImage);
title("Image with median filter");

% Медианная фильтрация стандартной функцией MatLAB
medImageMatLAB = medfilt2(impImage);
figure;
imshow(medImageMatLAB);
title("Image with standert median filter");

rmpath('.\image');
rmpath('.\function');
