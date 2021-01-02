clear
close all
clc

image = double(imread('face.bmp'));

figure;
imshow(image,[]);
title("Изображение");
% Используем маску раземером 15х15
newImage = adaptivCont (image, 15);

figure;
imshow(newImage,[]);
title("Обработанное изображение");
