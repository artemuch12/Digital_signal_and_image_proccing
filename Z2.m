clear
close all
clc

% Added paths for images and my own functions
addpath('.\image');
addpath('.\function');

image = imread('CASTLE.bmp');

[nRow, nCol, nColor] = size(image);

% Take image in grey shades and translate it from uint8 to double format
greyImage = rgb2gray(image);
greyImageDouble = double(greyImage);

figure;
imshow(image);
figure;
imshow(greyImage);

% Comparison own functions and integrated in MatLAB
meanMy = mean2My(greyImageDouble);
meanMatLAB = mean2(greyImageDouble);

stdMy = std2My(greyImageDouble);
stdMatLAB = std2(greyImageDouble);

hystoMy = histogramMy(greyImage);
figure;

plot(hystoMy, 'r');
hold on
histMat = imhist(greyImage)/nRow/nCol;
plot(histMat,'+b');

ef = empirFunction(hystoMy);
figure;
plot(ef);

rmpath('.\image');
rmpath('.\function');