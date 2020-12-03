% ценлерпхвеяйхе опенапюгнбюмхъ хгнапюфемхи
% GEOMETRIC IMAGE TRANSFORMATIONS

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = double(imread('face.bmp'));
[nRow, nCol, nColor] = size(image);
figure;
imshow(image,[]);
title("Original Image Face");

newImage = geoTrans(image, 1, 45, 1, 1);
figure;
imshow(newImage, [])

rmpath('.\image');
rmpath('.\function');