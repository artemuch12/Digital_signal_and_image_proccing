% Ã¿—Œ◊Õ¿ﬂ À»Õ≈…Õ¿ﬂ ‘»À‹“–¿÷»ﬂ »«Œ¡–¿∆≈Õ»…
% MASKED LINEAR IMAGE FILTERING

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = imread('face.bmp');
[nRow, nCol, nColor] = size(image);
figure;
imshow(image);
title("Original Image Face");

harLocalMed = 1/25*[[1 1 1 1 1]
                    [1 1 1 1 1]
                    [1 1 1 1 1]
                    [1 1 1 1 1]
                    [1 1 1 1 1]];
harCompLocalMed = -1/9*[1 1 1
                        1 -8 1
                        1 1 1];
localMed = convolution2(harLocalMed, image);
localMedStandart = conv2(harLocalMed, image);

CompLocalMed = convolution2(harCompLocalMed, image);
CompLocalMedStandart = conv2(harCompLocalMed, image);

figure;
imshow(localMed, []);
title("Local median");
figure;
imshow(localMedStandart, []);
title("Local median - MatLAB");

figure;
imshow(CompLocalMed, []);
title("Compensation local median");
figure;
imshow(CompLocalMedStandart, []);
title("Compensation local median - MatLAB");


rmpath('.\image');
rmpath('.\function');