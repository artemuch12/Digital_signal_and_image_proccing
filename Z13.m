% ЛОКАЛЬНЫЕ МЕТОДЫ ВЫДЕЛЕНИЯ КОНТУРОВ
% THE METHODS OF ALLOCATION OF CONTOURS

clear
close all
clc

addpath('.\image');
addpath('.\function');

% Загрузка оригинального изображения
image = double(imread('len.bmp'));
[nRow, nCol, nColor] = size(image);
figure;
imshow(image,[]);
title("Original Image Face");

% Маска для метода Лапласа
matrix = [0 1 0
          1 -4 1
          0 1 0];
      
% Подчеркивание контуров
gradImage = gradMetod(image);
laplaceMethod = abs(conv2(matrix, image));

% Вывод изображений с контурами 
figure;
subplot(1,2,1);
imshow(gradImage,[]);
title("Dragient method");
subplot(1,2,2);
imshow(laplaceMethod,[]);
title("Laplace method");

% Контрастирование изображений, приведение к диапазону 0..255
minImage = min(min(gradImage));
maxImage = max(max(gradImage));
gradImage = uint8(round((gradImage-minImage)/(maxImage-minImage).*255));

minImage = min(min(laplaceMethod));
maxImage = max(max(laplaceMethod));
laplaceMethod = uint8(round((laplaceMethod-minImage)/...
                (maxImage-minImage).*255));

% Получение гистограм изображений (использование нестандартной функции)
hystoGrad = histogramMy(gradImage);
hystoLaplace = histogramMy(laplaceMethod);

% Получение эмперической функций изображений (использование нестандартной 
% функции)
empGrad = empirFunction(hystoGrad);
empLaplace = empirFunction(hystoLaplace);
figure;
subplot(1,2,1);
plot(empGrad);
subplot(1,2,2);
plot(empLaplace);

% Определение порогов для бинаризации изображений по их эмперическим
% функциям. Значение эмперической функции для порога. 
thr = 0.9;
thrGrad = thresholdEmperFunction(empGrad, thr);
thrLaplace = thresholdEmperFunction(empLaplace, thr);
fprintf("Threshold for Gradient methode equals: %.f\n", thrGrad);
fprintf("Threshold for Laplace methode equals: %.f\n", thrLaplace);

% Бинаризация изображений по порогам (использование нестандартной 
% функции)
binGrad = binImage(gradImage, thrGrad);
binLaplace = binImage(laplaceMethod, thrLaplace);

figure;
subplot(1,2,1);
imshow(binGrad,[]);
title("Dragient method");
subplot(1,2,2);
imshow(binLaplace,[]);
title("Laplace method");

rmpath('.\image');
rmpath('.\function');