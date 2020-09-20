% опняреиьхе лерндш онщкелемрмнцн опенапюгнбюмхъ хгнапюфемхи
% THE SIMPLEST METHODS OF ELEMENT-BY-ELEMENT IMAGE CONVERSION

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = imread('kreml_mk.bmp');
[nRow, nCol, nColor] = size(image);
figure;
imshow(image);
title("Original Image");

[contrastImage, newDiap] = linContrast(image);
figure;
imshow(contrastImage);
title("Lean constrast");

negImage = neImage(contrastImage);
figure;
imshow(negImage);
title("Lean constrast and negative");


binImage = binImage(contrastImage, 127);
figure;
imshow(binImage);
title("Lean constrast and binary");

binImageM = im2bw(contrastImage, 0.5);
figure;
imshow(binImageM);
title("Binary MatLAB");

imwrite(binImage, 'binImage.bmp');

rmpath('.\image');
rmpath('.\function');