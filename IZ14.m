clear
close all
clc

image = double(imread('face.bmp'));

figure;
imshow(image,[]);
title("�����������");

newImage = rotateFree(image, 40, 60, 20);

figure;
imshow(newImage,[]);
title("���������� �����������");