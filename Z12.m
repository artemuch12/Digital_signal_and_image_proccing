% ВОССТАНОВЛЕНИЕ ЛИНЕЙНО-ИСКАЖЕННЫХ ИЗОБРАЖЕНИЙ ИНВЕРСНЫМ ФИЛЬТРОМ
% RESTORING LINEARLY DISTORTED IMAGES WITH AN INVERSE FILTER

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

% Загрузка из внешнего файла искаженных изображений и их вывод на экран
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

% Восстановление изображений
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

% Линейное контрастирование искаженного изображения с радиусом размытия 5
imageDouble = double(rasImage5);
minImage = min(min(imageDouble));
maxImage = max(max(imageDouble));
newImage = ((imageDouble-minImage)/(maxImage-minImage).*255);

% Вычеркивание верхней строчки (зануление) и попытка восстановления
% изображения
rasImage5destrHor = rasImage5;
rasImage5destrHor(1,:) = 0;

resImage5destrHor = restoringImage(rasImage5destrHor, 5);
figure;
imshow(resImage5destrHor, []);

% Вычеркивание левого столбца (зануление) и попытка восстановления
% изображения
rasImage5destrVer = rasImage5;
rasImage5destrVer(:,1) = 0;

resImage5destrVer = restoringImage(rasImage5destrVer, 5);
figure;
imshow(resImage5destrVer, []);

% Вычеркивание верхней строчки и левого столбца, и попытка восстановления
% изображения
rasImage5destrHV = rasImage5;
rasImage5destrHV(:,1) = 0;
rasImage5destrHV(1,:) = 0;
resImage5destrHV = restoringImage(rasImage5destrHV, 5);
figure;
imshow(resImage5destrHV, []);

% Линейное контрастирование искаженного изображения с радиусом размытия 5
% и его восстановление 
minImage = min(min(rasImage5));
maxImage = max(max(rasImage5));

newImage = round((rasImage5-minImage)/(maxImage-minImage).*255);
nImage = restoringImage(newImage, 5);
figure;
imshow(nImage, []);

rmpath('.\image');
rmpath('.\function');